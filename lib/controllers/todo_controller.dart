import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/controllers/auth_controller.dart';
import 'package:riverpod_test/models/todo.dart';
import 'package:riverpod_test/repositories/todo_repository.dart';

final todoControllerProvider = Provider<TodoListController>((ref) {
  final user = ref.watch(authControllerProvider);

  return TodoListController(ref.read, user?.uid);
});

final todoListControllerProvider =
    StateNotifierProvider<TodoListController, AsyncValue<List<MyTodo>>>((ref) {
  final user = ref.watch(authControllerProvider);

  return TodoListController(ref.read, user?.uid);
});

class TodoListController extends StateNotifier<AsyncValue<List<MyTodo>>> {
  TodoListController(this._read, this.userId) : super(AsyncValue.loading());

  final String? userId;
  final Reader _read;

  Future<void> retrieveTodos({bool isRefreshing = false}) async {
    if (isRefreshing) state = AsyncValue.loading();
    try {
      final todoList =
          await _read(todoRepositoryProvider).retriveTodos(userId: userId!);

      state = AsyncValue.data(todoList);
      print('Todos List len: ' + todoList.length.toString());
    } on Exception catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Todo {}
