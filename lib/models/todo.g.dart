// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyTodo _$_$_MyTodoFromJson(Map<String, dynamic> json) {
  return _$_MyTodo(
    id: json['id'] as String?,
    title: json['title'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$_$_MyTodoToJson(_$_MyTodo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
    };
