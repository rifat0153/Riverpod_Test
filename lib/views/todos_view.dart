import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/views/clock_view.dart';
import '../models/todo.dart';
import 'package:riverpod_test/controllers/todo_controller.dart';

class TodosView extends HookWidget {
  TodosView({Key? key}) : super(key: key);

  final todoListControllerState = useProvider(todoListControllerProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return context
              .read(todoListControllerProvider.notifier)
              .retrieveTodos();
        },
        child: Container(
          child: todoListControllerState.when(
            data: (todos) {
              if (todos.isEmpty)
                return Center(
                  child: Text('No Todos'),
                );
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, i) => Text(todos[i].title),
              );
            },
            loading: () => CircularProgressIndicator(),
            error: (e, s) => Text(e.toString()),
          ),
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ClockView()));
          // context
          //     .read(todoListControllerProvider.notifier)
          //     .retrieveTodos(isRefreshing: true);
        },
        child: Text('See Clock'),
      ),
    );
  }
}
