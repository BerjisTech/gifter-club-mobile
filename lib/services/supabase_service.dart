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
  final BehaviorSubject<User?> _userSubject = BehaviorSubject<User?>.seeded(
    null,
  );
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
      // Redirect back to the mobile app via deep link or web via env redirect URL
      final redirectTo = dotenv.env['SUPABASE_REDIRECT_URL'];
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: redirectTo,
      );
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
    // Ensure profile exists and is up-to-date
    try {
      final data = await supabase
          .from('profiles')
          .select('id, email')
          .eq('user_id', user.id)
          .maybeSingle();
      if (data == null) {
        final username = _generateUsername(user);
        final name =
            (user.userMetadata?['full_name'] as String?) ??
            (user.userMetadata?['name'] as String?) ??
            '';
        final image = (user.userMetadata?['avatar_url'] as String?) ?? '';
        await supabase.from('profiles').insert({
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
      } else {
        final existingEmail = data['email'] as String?;
        final newEmail = user.email ?? '';
        if (existingEmail != newEmail) {
          await supabase
              .from('profiles')
              .update({'email': newEmail})
              .eq('user_id', user.id);
        }
      }
    } catch (e) {
      print('Error handling profile: $e');
    }
  }

  String _generateUsername(User user) {
    final base =
        ((user.userMetadata?['full_name'] as String?) ??
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
    try {
      final data = await supabase
          .from('profiles')
          .select()
          .eq('user_id', userId)
          .maybeSingle();
      if (data == null) return null;
      return Profile.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error fetching profile by user ID: $e');
      return null;
    }
  }

  /// Fetch a profile by username.
  Future<Profile?> getProfileByUsername(String username) async {
    try {
      final data = await supabase
          .from('profiles')
          .select()
          .eq('username', username)
          .maybeSingle();
      if (data == null) return null;
      return Profile.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error fetching profile by username: $e');
      return null;
    }
  }

  /// Update profile fields for the given or current user.
  Future<Profile?> updateProfile(
    Map<String, dynamic> updates, {
    String? userId,
  }) async {
    final uid = userId ?? _userSubject.value?.id;
    if (uid == null) return null;
    try {
      final data = await supabase
          .from('profiles')
          .update(updates)
          .eq('user_id', uid)
          .select()
          .maybeSingle();
      if (data == null) return null;
      return Profile.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error updating profile: $e');
      return null;
    }
  }

  /// Fetch gifts with pagination.
  Future<List<Gift>> getGifts({int limit = 12, int offset = 0}) async {
    try {
      final data = await supabase
          .from('gifts')
          .select()
          .order('id', ascending: false)
          .range(offset, offset + limit - 1);
      return (data as List)
          .map((e) => Gift.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching gifts: $e');
      return [];
    }
  }

  /// Fetch wishlists for a user.
  Future<List<Wishlist>> getWishlistByUserId(String userId) async {
    try {
      final data = await supabase
          .from('wishlists')
          .select()
          .eq('user_id', userId);
      return (data as List)
          .map((e) => Wishlist.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching wishlist: $e');
      return [];
    }
  }

  /// Get total and fulfilled wishlist counts for a user.
  Future<Map<String, int>> getUserWishlistCount(String userId) async {
    try {
      final resp = await supabase
          .from('wishlists')
          .select('id, is_fulfilled')
          .eq('user_id', userId)
          .count(CountOption.exact);
      final data = resp.data as List? ?? [];
      final total = resp.count ?? 0;
      final fulfilled = data
          .where((i) => (i as Map<String, dynamic>)['is_fulfilled'] == true)
          .length;
      return {'total': total, 'fulfilled': fulfilled};
    } catch (e) {
      print('Error fetching wishlist count: $e');
      return {'total': 0, 'fulfilled': 0};
    }
  }

  /// Fetch withdrawal requests for a user.
  Future<List<WithdrawalRequest>> getWithdrawalsByUser(String userId) async {
    try {
      final data = await supabase
          .from('withdrawals')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return (data as List)
          .map((e) => WithdrawalRequest.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching withdrawals: $e');
      return [];
    }
  }

  /// Fetch recent gifts for user or global.
  Future<List<RecentGift>> getRecentGifts({
    int limit = 50,
    String? userId,
  }) async {
    try {
      final data = await supabase
          .from('recent_gifts')
          .select()
          .order('created_at', ascending: false)
          .limit(limit);
      return (data as List)
          .map((e) => RecentGift.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching recent gifts: $e');
      return [];
    }
  }

  /// Fetch gifts received by a specific user.
  Future<List<RecentGift>> getGiftsReceivedByUser(
    String userId, {
    int limit = 50,
  }) async {
    try {
      final data = await supabase
          .from('recent_gifts')
          .select()
          .eq('receiver_id', userId)
          .order('created_at', ascending: false)
          .limit(limit);
      return (data as List)
          .map((e) => RecentGift.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching received gifts: $e');
      return [];
    }
  }

  /// Record a token transaction.
  Future<TokenTransaction?> recordTokenTransaction(TokenTransaction tx) async {
    try {
      final data = await supabase
          .from('token_transactions')
          .insert(tx.toJson())
          .select()
          .maybeSingle();
      if (data == null) return null;
      return TokenTransaction.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error recording token transaction: $e');
      return null;
    }
  }

  /// Update a token transaction record.
  Future<TokenTransaction?> updateTokenTransaction(
    String id,
    Map<String, dynamic> updates,
  ) async {
    try {
      final data = await supabase
          .from('token_transactions')
          .update(updates)
          .eq('id', id)
          .select()
          .maybeSingle();
      if (data == null) return null;
      return TokenTransaction.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error updating token transaction: $e');
      return null;
    }
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
    try {
      final resp = await supabase.rpc(
        'request_withdrawal',
        params: {
          'p_user_id': userId,
          'p_tokens': tokens,
          'p_target_currency': targetCurrency,
          'p_exchange_rate': exchangeRate,
          'p_payment_method': paymentMethod,
          'p_payment_details': paymentDetails,
        },
      );
      if (resp.error != null) {
        print('Error requesting withdrawal: ${resp.error!.message}');
        return null;
      }
      final data = resp.data;
      return data == null
          ? null
          : WithdrawalRequest.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      print('Error requesting withdrawal: $e');
      return null;
    }
  }

  /// Create a notification record.
  Future<void> createNotification({
    required String userId,
    required String type,
    String? referenceId,
    required String message,
  }) async {
    try {
      await supabase.from('notifications').insert({
        'user_id': userId,
        'type': type,
        'reference_id': referenceId,
        'message': message,
      });
    } catch (e) {
      print('Error creating notification: $e');
    }
  }

  /// Record an authentication log for the user via Edge Function.
  Future<void> recordAuthLog(User user) async {
    try {
      // Capture provider and device info similar to Angular implementation
      final provider = user.appMetadata['provider'] as String? ?? 'unknown';
      // Mark client type (e.g. for Flutter web/mobile)
      final device = 'flutter-client';
      await supabase.functions.invoke(
        'auth-log',
        body: {'user_id': user.id, 'provider': provider, 'device': device},
      );
    } catch (e) {
      print('Error recording auth log via Edge Function: $e');
    }
  }
}

/// Global SupabaseService instance for app-wide use.
final supabaseService = SupabaseService();
