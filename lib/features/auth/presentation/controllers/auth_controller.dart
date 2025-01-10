import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aws_cert_prep_pro/features/auth/data/repositories/auth_repository_impl.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(const AsyncValue.loading()) {
    _authRepository.authStateChanges().listen((user) {
      state = AsyncValue.data(user);
    });
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      await _authRepository.signUpWithEmail(
        email: email,
        password: password,
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      await _authRepository.signInWithEmail(
        email: email,
        password: password,
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      state = const AsyncValue.loading();
      await _authRepository.signInWithGoogle();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    try {
      state = const AsyncValue.loading();
      await _authRepository.signOut();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}