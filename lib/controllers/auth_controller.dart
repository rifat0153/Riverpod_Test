import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:riverpod_test/repositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
  return AuthController(ref.read);
});

class AuthController extends StateNotifier<AsyncValue<User?>> {
  AuthController(this._read) : super(AsyncValue.loading()) {
    state = AsyncValue.loading();
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider).authStateChanges.listen(
          (user) => state = AsyncValue.data(user),
        );
  }

  Reader _read;
  StreamSubscription<User?>? _authStateChangesSubscription;

  User? getUser() {
    if (state.data?.value != null) {
      return state.data?.value;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }
}
