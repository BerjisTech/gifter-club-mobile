import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  /// TODO: Port methods from Angular SupabaseService (initializeAuth,
  /// signInWithGoogle, signOut, handleProfile, and other RPC and CRUD methods).
}