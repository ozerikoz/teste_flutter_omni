// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardModel _$BoardModelFromJson(Map<String, dynamic> json) => _BoardModel(
      id: json['id'] as String,
      title: json['title'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => TeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BoardModelToJson(_BoardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'members': instance.members,
      'teams': instance.teams,
    };
