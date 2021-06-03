import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/providers/auth_providers.dart';
import 'dart:async';

import 'package:riverpod_test/repositories/auth_repository.dart';

final todoListControllerProvider =
    StateNotifierProvider<TodoListController, AsyncValue<List<Todo>>>((ref) {
  final user = ref.watch(currentUserProvider);

  return TodoListController(ref.read, '');
});

class TodoListController extends StateNotifier<AsyncValue<List<Todo>>> {
  TodoListController(this._read, this.userId) : super(AsyncValue.loading());

  final String userId;
  final Reader _read;

  // StreamSubscription

  @override
  void dispose() {
    super.dispose();
  }
}

class Todo {}
