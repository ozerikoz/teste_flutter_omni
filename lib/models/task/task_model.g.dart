// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  teams:
      (json['teams'] as List<dynamic>?)
          ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'teams': instance.teams,
  'members': instance.members,
};
