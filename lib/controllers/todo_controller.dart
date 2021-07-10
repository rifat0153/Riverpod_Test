import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/controllers/auth_controller.dart';
import 'package:riverpod_test/models/todo.dart';
import 'package:riverpod_test/repositories/todo_repository.dart';

final todoListControllerProvider =
    StateNotifierProvider.autoDispose<TodoListController, AsyncValue<List<MyTodo>>>((ref) {
  final user = ref.watch(authControllerProvider.notifier).getUser();

  return TodoListController(ref.read, user?.uid)..retrieveTodos();
});

class TodoListController extends StateNotifier<AsyncValue<List<MyTodo>>> {
  TodoListController(this._read, this.userId) : super(AsyncValue.data([]));

  final String? userId;
  final Reader _read;

  StreamSubscription<List<MyTodo>>? todoSubcription;

  Future<void> retrieveTodos({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final todoList = await _read(todoRepositoryProvider).retriveTodos(userId: userId ?? '');

      // todoSubcription?.cancel();
      // todoSubcription = _read(todoRepositoryProvider)
      //     .retriveTodosStream(userId: userId!)
      //     .listen((todoList) => state = AsyncValue.data(todoList));

      state = AsyncValue.data(todoList);
      print('Todos List len: ' + todoList.length.toString());
    } on Exception catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  @override
  void dispose() {
    todoSubcription?.cancel();
    super.dispose();
  }
}

class Todo {}
