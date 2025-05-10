// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_column_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardColumnModel _$BoardColumnModelFromJson(Map<String, dynamic> json) =>
    _BoardColumnModel(
      id: json['id'] as String,
      title: json['title'] as String,
      tasks:
          (json['tasks'] as List<dynamic>)
              .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BoardColumnModelToJson(_BoardColumnModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tasks': instance.tasks,
    };
