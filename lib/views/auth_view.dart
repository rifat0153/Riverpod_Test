import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/auth_providers.dart';
import 'package:riverpod_test/repositories/auth_repository.dart';
import 'package:riverpod_test/views/todos_view.dart';

class AuthView extends ConsumerWidget {
  AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ScopedReader watch ) {
    print('In authview');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read(authRepositoryProvider).signOut();
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: TodosView(),
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
            context.read(authRepositoryProvider).signInWithEmail();
          },
          child: Text('Log in'),
        ),
      ),
    );
  }
}
