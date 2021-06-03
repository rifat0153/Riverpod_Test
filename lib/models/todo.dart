import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class MyTodo with _$MyTodo {
  const MyTodo._();

  const factory MyTodo({
    String? id,
    required String title,
    required String userId,
  }) = _MyTodo;

  factory MyTodo.fromJson(Map<String, dynamic> json) => _$MyTodoFromJson(json);
}
