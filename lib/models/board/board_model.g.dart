// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Board _$BoardFromJson(Map<String, dynamic> json) => _Board(
  id: json['id'] as String,
  title: json['title'] as String,
  members:
      (json['members'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
  teams:
      (json['teams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BoardToJson(_Board instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'members': instance.members,
  'teams': instance.teams,
};
