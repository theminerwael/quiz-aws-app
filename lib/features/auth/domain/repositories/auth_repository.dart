import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
  });
  
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  });
  
  Future<User?> signInWithGoogle();
  
  Future<void> signOut();
  
  Stream<User?> authStateChanges();
}