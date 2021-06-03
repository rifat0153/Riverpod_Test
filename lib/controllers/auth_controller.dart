import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';

class AuthController extends StateNotifier<User?> {
  AuthController(this._read) : super(null) {
    state = null;
  }

  Reader _read;

  

  @override
  void dispose() {
    super.dispose();
  }
}
