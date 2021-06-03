import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/providers/auth_providers.dart';
import 'package:riverpod_test/services/auth_service.dart';

class AuthView extends HookWidget {
  AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('In authview');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read(authServiceProvider).signOut();
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: Center(
        child: Text('Loggeed In'),
      ),
    );
  }
}

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('In loginview');

    return Container(
      child: Center(
        child: MaterialButton(
          onPressed: () {
            context.read(authServiceProvider).singInAnonoymously();
          },
          child: Text('Log in'),
        ),
      ),
    );
  }
}
