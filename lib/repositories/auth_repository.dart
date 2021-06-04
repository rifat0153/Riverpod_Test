import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/providers/general_providers.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read);
});

class AuthRepository {
  AuthRepository(this._read);

  Reader _read;

  Future<User?> signInWithEmail() async {
    var auth = _read(authProvider);

    await auth.signInWithEmailAndPassword(
        email: 'user@gmail.com', password: '123456');
  }

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
