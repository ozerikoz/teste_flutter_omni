// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_column_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardColumnModel {

 String get id; String get title; List<TaskModel> get tasks;
/// Create a copy of BoardColumnModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardColumnModelCopyWith<BoardColumnModel> get copyWith => _$BoardColumnModelCopyWithImpl<BoardColumnModel>(this as BoardColumnModel, _$identity);

  /// Serializes this BoardColumnModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardColumnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.tasks, tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'BoardColumnModel(id: $id, title: $title, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $BoardColumnModelCopyWith<$Res>  {
  factory $BoardColumnModelCopyWith(BoardColumnModel value, $Res Function(BoardColumnModel) _then) = _$BoardColumnModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<TaskModel> tasks
});




}
/// @nodoc
class _$BoardColumnModelCopyWithImpl<$Res>
    implements $BoardColumnModelCopyWith<$Res> {
  _$BoardColumnModelCopyWithImpl(this._self, this._then);

  final BoardColumnModel _self;
  final $Res Function(BoardColumnModel) _then;

/// Create a copy of BoardColumnModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? tasks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BoardColumnModel implements BoardColumnModel {
  const _BoardColumnModel({required this.id, required this.title, required final  List<TaskModel> tasks}): _tasks = tasks;
  factory _BoardColumnModel.fromJson(Map<String, dynamic> json) => _$BoardColumnModelFromJson(json);

@override final  String id;
@override final  String title;
 final  List<TaskModel> _tasks;
@override List<TaskModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of BoardColumnModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardColumnModelCopyWith<_BoardColumnModel> get copyWith => __$BoardColumnModelCopyWithImpl<_BoardColumnModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoardColumnModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardColumnModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'BoardColumnModel(id: $id, title: $title, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$BoardColumnModelCopyWith<$Res> implements $BoardColumnModelCopyWith<$Res> {
  factory _$BoardColumnModelCopyWith(_BoardColumnModel value, $Res Function(_BoardColumnModel) _then) = __$BoardColumnModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<TaskModel> tasks
});




}
/// @nodoc
class __$BoardColumnModelCopyWithImpl<$Res>
    implements _$BoardColumnModelCopyWith<$Res> {
  __$BoardColumnModelCopyWithImpl(this._self, this._then);

  final _BoardColumnModel _self;
  final $Res Function(_BoardColumnModel) _then;

/// Create a copy of BoardColumnModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? tasks = null,}) {
  return _then(_BoardColumnModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,
  ));
}


}

// dart format on
