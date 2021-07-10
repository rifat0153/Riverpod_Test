import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/controllers/auth_controller.dart';
import 'package:riverpod_test/providers/auth_providers.dart';
import 'package:riverpod_test/views/auth_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var user = watch(currentUserProvider);
    final authControllerState = watch(authControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: authControllerState.when(
          data: (user) => user == null ? LoginView() : AuthView(),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, s) => Text(e.toString()),
        ),
      ),
    );
  }
}


    //  user.when(
    //         data: (user) {
    //           print(user);
    //           return user != null ? AuthView() : LoginView();
    //         },
    //         loading: () => CircularProgressIndicator(),
    //         error: (e, s) => CircularProgressIndicator()),