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

  List<MyTodo> todos;

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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _addTodos();
    });

    _animationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  void _addTodos() {
    // get data from db
    List<MyTodo> _todos = widget.todos;

    Future ft = Future(() {});
    _todos.forEach((MyTodo trip) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _todoTiles.add(_buildTile(trip));
          _listKey.currentState?.insertItem(_todoTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(MyTodo todo) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.all(25),
      title: Text(todo.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _todoTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _todoTiles[index],
          );
        });
  }
}
