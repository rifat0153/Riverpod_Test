import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/providers/general_providers.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read);
});

class AuthService {
  AuthService(this._read);

  Reader _read;

  Future<User?> singInAnonoymously() async {
    var auth = _read(authProvider);

    await auth.signInAnonymously();
  }

  Stream<User?> get authStateChanges => _read(authProvider).authStateChanges();

  Future<User?> signOut() async {
    var auth = _read(authProvider);

    await auth.signOut();
  }
}
