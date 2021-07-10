import 'package:flutter/material.dart';

import 'package:riverpod_test/models/todo.dart';

class TodoListView extends StatefulWidget {
  TodoListView({Key? key, required this.todos}) : super(key: key);

  final List<MyTodo> todos;

  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Widget> _todoTiles = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _addTodos();
    });
  }

  void _addTodos() {
    // get data from db
    List<MyTodo> _todos = widget.todos;

    Future ft = Future(() {});
    _todos.forEach((MyTodo todo) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _todoTiles.add(_buildTile(todo));
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

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

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
