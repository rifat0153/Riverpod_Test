import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var user = useProvider(currentUserProvider);
    final authControllerState = useProvider(authControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: authControllerState == null ? LoginView() : AuthView(),
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