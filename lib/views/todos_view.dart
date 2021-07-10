import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_test/controllers/todo_controller.dart';
import 'package:riverpod_test/models/todo.dart';
import 'package:riverpod_test/views/todoListView.dart';

class TodosView extends StatelessWidget {
  TodosView({Key? key}) : super(key: key);

  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _todoTiles = [];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ScopedReader watch, child) {
      var todos = watch(todoListControllerProvider);

      if (todos.data!.value.length > 0) {
        // return TodoListView(todos: todos.data!.value);
        return _BuildListTile(todos: todos.data!.value);
      }

      return Text(todos.data!.value.length.toString());
    });
  }
}

class _BuildListTile extends StatefulWidget {
  _BuildListTile({Key? key, required this.todos}) : super(key: key);

  final List<MyTodo> todos;

  @override
  __BuildListTileState createState() => __BuildListTileState();
}

class __BuildListTileState extends State<_BuildListTile> with TickerProviderStateMixin {
  late AnimationController _animationController;
  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  List<Widget> _todoTiles = [];
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    // Code to Stagger Load ListView data on INIT VIEW
    Future ft = Future(() {});
    widget.todos.forEach((MyTodo todo) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 200), () {
          int index = widget.todos.indexOf(todo);
          _listKey.currentState?.insertItem(index);
        });
      });
    });

    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _todoTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: Text(widget.todos[index].title),
          );
        });
  }
}
