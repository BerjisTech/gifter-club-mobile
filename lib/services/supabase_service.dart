import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/supabase_models.dart';

/// Service wrapping Supabase client operations.
class SupabaseService {
  /// Primary Supabase client using anon/public key.
  final SupabaseClient supabase;

  /// Admin Supabase client using service role key.
  final SupabaseClient supabaseAdmin;

  /// Emits the current authenticated user.
  final BehaviorSubject<User?> _userSubject = BehaviorSubject<User?>.seeded(null);
  Stream<User?> get user$ => _userSubject.stream;

  /// Initializes Supabase clients and auth state listener.
  SupabaseService()
      : supabase = Supabase.instance.client,
        supabaseAdmin = SupabaseClient(
          dotenv.env['SUPABASE_URL']!,
          dotenv.env['SUPABASE_SERVICE_ROLE_KEY']!,
        );

  /// Initializes authentication: loads current user and listens for auth changes.
  Future<void> initializeAuth() async {
    final user = supabase.auth.currentUser;
    _userSubject.add(user);
    supabase.auth.onAuthStateChange.listen((data) async {
      final event = data.event;
      final session = data.session;
      final current = session?.user;
      _userSubject.add(current);
      if (event == AuthChangeEvent.signedIn && current != null) {
        await handleProfile(current);
      }
      if (event == AuthChangeEvent.signedIn && current != null) {
        await recordAuthLog(current);
      }
    });
    if (user != null) {
      await handleProfile(user);
    }
  }

  /// Sign in via Google OAuth.
  Future<void> signInWithGoogle() async {
    try {
      await supabase.auth.signInWithOAuth(Provider.google);
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  /// Sign out the current user.
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /// Ensure a profile exists for newly signed-in users and updates email.
  Future<void> handleProfile(User user) async {
    try {
      final resp = await supabase
          .from('profiles')
          .select('id, email')
          .eq('user_id', user.id)
          .maybeSingle();
      if (resp.error != null) {
        print('Error checking profile: ${resp.error!.message}');
        return;
      }
      final data = resp.data;
      if (data == null) {
        final username = _generateUsername(user);
        final name = (user.userMetadata?['full_name'] as String?) ??
            (user.userMetadata?['name'] as String?) ??
            '';
        final image = (user.userMetadata?['avatar_url'] as String?) ?? '';
        final insert = await supabase.from('profiles').insert({
          'user_id': user.id,
          'email': user.email,
          'username': username,
          'name': name,
          'bio': '',
          'image': image,
          'followers_count': 0,
          'following_count': 0,
          'is_following': false,
          'gifter_level': 1,
          'gifter_level_name': '',
          'gifts_sent': 0,
        });
        if (insert.error != null) {
          print('Error creating profile: ${insert.error!.message}');
        }
      } else {
        final existingEmail = data['email'] as String?;
        final newEmail = user.email ?? '';
        if (existingEmail != newEmail) {
          final upd = await supabase
              .from('profiles')
              .update({'email': newEmail})
              .eq('user_id', user.id);
          if (upd.error != null) {
            print('Error updating profile email: ${upd.error!.message}');
          }
        }
      }
    } catch (e) {
      print('Unexpected error handling profile: $e');
    }
  }

  String _generateUsername(User user) {
    final base = ((user.userMetadata?['full_name'] as String?) ??
            user.email?.split('@').first ??
            'user')
        .trim()
        .toLowerCase();
    final slug = base
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'[^a-z0-9-_]'), '');
    final suffix = DateTime.now().millisecondsSinceEpoch
        .toRadixString(36)
        .substring(2, 6);
    return '$slug-$suffix';
  }

  /// Get the currently authenticated user.
  Future<User?> currentUser() async {
    return supabase.auth.currentUser;
  }

  /// Fetch a profile by its user_id.
  Future<Profile?> getProfileByUserId(String userId) async {
    final resp = await supabase
        .from('profiles')
        .select()
        .eq('user_id', userId)
        .maybeSingle();
    if (resp.error != null) {
      print('Error fetching profile by user ID: ${resp.error!.message}');
      return null;
    }
    return resp.data as Profile?;
  }

  /// Fetch a profile by username.
  Future<Profile?> getProfileByUsername(String username) async {
    final resp = await supabase
        .from('profiles')
        .select()
        .eq('username', username)
        .maybeSingle();
    if (resp.error != null) {
      print('Error fetching profile by username: ${resp.error!.message}');
      return null;
    }
    return resp.data as Profile?;
  }

  /// Update profile fields for the given or current user.
  Future<Profile?> updateProfile(
    Map<String, dynamic> updates, {
    String? userId,
  }) async {
    final uid = userId ?? _userSubject.value?.id;
    if (uid == null) return null;
    final resp = await supabase
        .from('profiles')
        .update(updates)
        .eq('user_id', uid)
        .select()
        .maybeSingle();
    if (resp.error != null) {
      print('Error updating profile: ${resp.error!.message}');
      return null;
    }
    return resp.data as Profile?;
  }

  /// Fetch gifts with pagination.
  Future<List<Gift>> getGifts({int limit = 12, int offset = 0}) async {
    final resp = await supabase
        .from('gifts')
        .select()
        .order('id', ascending: false)
        .range(offset, offset + limit - 1);
    if (resp.error != null) {
      print('Error fetching gifts: ${resp.error!.message}');
      return [];
    }
    return (resp.data as List).cast<Gift>();
  }

  /// Fetch wishlists for a user.
  Future<List<Wishlist>> getWishlistByUserId(String userId) async {
    final resp = await supabase.from('wishlists').select().eq('user_id', userId);
    if (resp.error != null) {
      print('Error fetching wishlist: ${resp.error!.message}');
      return [];
    }
    return (resp.data as List).cast<Wishlist>();
  }

  /// Get total and fulfilled wishlist counts for a user.
  Future<Map<String, int>> getUserWishlistCount(String userId) async {
    final resp = await supabase
        .from('wishlists')
        .select('id, is_fulfilled', const FetchOptions(count: CountOption.exact))
        .eq('user_id', userId);
    if (resp.error != null) {
      print('Error fetching wishlist count: ${resp.error!.message}');
      return {'total': 0, 'fulfilled': 0};
    }
    final data = resp.data ?? [];
    final total = resp.count ?? 0;
    final fulfilled = data.where((i) => i['is_fulfilled'] == true).length;
    return {'total': total, 'fulfilled': fulfilled};
  }

  /// Fetch withdrawal requests for a user.
  Future<List<WithdrawalRequest>> getWithdrawalsByUser(String userId) async {
    final resp = await supabase
        .from('withdrawals')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    if (resp.error != null) {
      print('Error fetching withdrawals: ${resp.error!.message}');
      return [];
    }
    return (resp.data as List).cast<WithdrawalRequest>();
  }

  /// Fetch recent gifts for user or global.
  Future<List<RecentGift>> getRecentGifts({
    int limit = 50,
    String? userId,
  }) async {
    var query = supabase
        .from('recent_gifts')
        .select()
        .order('created_at', ascending: false)
        .limit(limit);
    final resp = await query;
    if (resp.error != null) {
      print('Error fetching recent gifts: ${resp.error!.message}');
      return [];
    }
    return (resp.data as List).cast<RecentGift>();
  }
  
  /// Fetch gifts received by a specific user.
  Future<List<RecentGift>> getGiftsReceivedByUser(String userId, {int limit = 50}) async {
    final resp = await supabase
        .from('recent_gifts')
        .select()
        .eq('receiver_id', userId)
        .order('created_at', ascending: false)
        .limit(limit);
    if (resp.error != null) {
      print('Error fetching received gifts: ${resp.error!.message}');
      return [];
    }
    return (resp.data as List).cast<RecentGift>();
  }

  /// Record a token transaction.
  Future<TokenTransaction?> recordTokenTransaction(TokenTransaction tx) async {
    final resp = await supabase
        .from('token_transactions')
        .insert(tx.toJson())
        .select()
        .maybeSingle();
    if (resp.error != null) {
      print('Error recording token transaction: ${resp.error!.message}');
      return null;
    }
    return resp.data as TokenTransaction?;
  }

  /// Update a token transaction record.
  Future<TokenTransaction?> updateTokenTransaction(
    String id,
    Map<String, dynamic> updates,
  ) async {
    final resp = await supabase
        .from('token_transactions')
        .update(updates)
        .eq('id', id)
        .select()
        .maybeSingle();
    if (resp.error != null) {
      print('Error updating token transaction: ${resp.error!.message}');
      return null;
    }
    return resp.data as TokenTransaction?;
  }

  /// Invoke an Edge Function to process token purchase.
  Future<void> processPurchaseTokensRpc(
    String userId,
    num tokens,
    String txRef,
  ) async {
    try {
      await supabase.functions.invoke(
        'purchase-tokens',
        body: {'userId': userId, 'tokens': tokens, 'txRef': txRef},
      );
    } catch (e) {
      print('Error processing purchase-tokens function: $e');
    }
  }

  /// Request a withdrawal via stored procedure.
  Future<WithdrawalRequest?> requestWithdrawal(
    String userId,
    num tokens,
    String targetCurrency,
    num exchangeRate,
    String paymentMethod,
    Map<String, dynamic> paymentDetails,
  ) async {
    final resp = await supabase.rpc('request_withdrawal', params: {
      'p_user_id': userId,
      'p_tokens': tokens,
      'p_target_currency': targetCurrency,
      'p_exchange_rate': exchangeRate,
      'p_payment_method': paymentMethod,
      'p_payment_details': paymentDetails,
    });
    if (resp.error != null) {
      print('Error requesting withdrawal: ${resp.error!.message}');
      return null;
    }
    return resp.data as WithdrawalRequest?;
  }

  /// Create a notification record.
  Future<void> createNotification({
    required String userId,
    required String type,
    String? referenceId,
    required String message,
  }) async {
    final resp = await supabase.from('notifications').insert({
      'user_id': userId,
      'type': type,
      'reference_id': referenceId,
      'message': message,
    });
    if (resp.error != null) {
      print('Error creating notification: ${resp.error!.message}');
    }
  }

  /// Record an authentication log for the user.
  Future<void> recordAuthLog(User user) async {
    try {
      await supabase.from('auth_logs').insert({
        'user_id': user.id,
        'email': user.email,
        'event': 'signed_in',
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error recording auth log: $e');
    }
  }
}

/// Global SupabaseService instance for app-wide use.
final supabaseService = SupabaseService();