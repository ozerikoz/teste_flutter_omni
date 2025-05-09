import "package:freezed_annotation/freezed_annotation.dart";

part "team_model.freezed.dart";
part "team_model.g.dart";

@freezed
sealed class Team with _$Team {
  const factory Team({
    required String id,
    required String name,
    required String color,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
