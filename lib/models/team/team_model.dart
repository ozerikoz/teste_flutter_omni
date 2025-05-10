import "package:freezed_annotation/freezed_annotation.dart";

part "team_model.freezed.dart";
part "team_model.g.dart";

@freezed
sealed class TeamModel with _$TeamModel {
  const factory TeamModel({
    required String id,
    required String name,
    required String color,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}
