import "package:flutter_teste_omni/models/team/team_model.dart";
import "package:flutter_teste_omni/models/user/user_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "board_model.freezed.dart";
part "board_model.g.dart";

@freezed
sealed class BoardModel with _$BoardModel {
  const factory BoardModel({
    required String id,
    required String title,
    required List<UserModel> members,
    required List<TeamModel> teams,
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);
}
