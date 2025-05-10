// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardColumn _$BoardColumnFromJson(Map<String, dynamic> json) => _BoardColumn(
  id: json['id'] as String,
  title: json['title'] as String,
  tasks:
      (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BoardColumnToJson(_BoardColumn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tasks': instance.tasks,
    };
