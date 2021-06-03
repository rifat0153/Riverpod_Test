// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyTodo _$MyTodoFromJson(Map<String, dynamic> json) {
  return _MyTodo.fromJson(json);
}

/// @nodoc
class _$MyTodoTearOff {
  const _$MyTodoTearOff();

  _MyTodo call({String? id, required String title, required String userId}) {
    return _MyTodo(
      id: id,
      title: title,
      userId: userId,
    );
  }

  MyTodo fromJson(Map<String, Object> json) {
    return MyTodo.fromJson(json);
  }
}

/// @nodoc
const $MyTodo = _$MyTodoTearOff();

/// @nodoc
mixin _$MyTodo {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTodoCopyWith<MyTodo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTodoCopyWith<$Res> {
  factory $MyTodoCopyWith(MyTodo value, $Res Function(MyTodo) then) =
      _$MyTodoCopyWithImpl<$Res>;
  $Res call({String? id, String title, String userId});
}

/// @nodoc
class _$MyTodoCopyWithImpl<$Res> implements $MyTodoCopyWith<$Res> {
  _$MyTodoCopyWithImpl(this._value, this._then);

  final MyTodo _value;
  // ignore: unused_field
  final $Res Function(MyTodo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MyTodoCopyWith<$Res> implements $MyTodoCopyWith<$Res> {
  factory _$MyTodoCopyWith(_MyTodo value, $Res Function(_MyTodo) then) =
      __$MyTodoCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String title, String userId});
}

/// @nodoc
class __$MyTodoCopyWithImpl<$Res> extends _$MyTodoCopyWithImpl<$Res>
    implements _$MyTodoCopyWith<$Res> {
  __$MyTodoCopyWithImpl(_MyTodo _value, $Res Function(_MyTodo) _then)
      : super(_value, (v) => _then(v as _MyTodo));

  @override
  _MyTodo get _value => super._value as _MyTodo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? userId = freezed,
  }) {
    return _then(_MyTodo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyTodo extends _MyTodo {
  const _$_MyTodo({this.id, required this.title, required this.userId})
      : super._();

  factory _$_MyTodo.fromJson(Map<String, dynamic> json) =>
      _$_$_MyTodoFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String userId;

  @override
  String toString() {
    return 'MyTodo(id: $id, title: $title, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MyTodo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(userId);

  @JsonKey(ignore: true)
  @override
  _$MyTodoCopyWith<_MyTodo> get copyWith =>
      __$MyTodoCopyWithImpl<_MyTodo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MyTodoToJson(this);
  }
}

abstract class _MyTodo extends MyTodo {
  const factory _MyTodo(
      {String? id, required String title, required String userId}) = _$_MyTodo;
  const _MyTodo._() : super._();

  factory _MyTodo.fromJson(Map<String, dynamic> json) = _$_MyTodo.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MyTodoCopyWith<_MyTodo> get copyWith => throw _privateConstructorUsedError;
}
