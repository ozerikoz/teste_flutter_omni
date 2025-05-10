import "package:flutter_teste_omni/models/team/team_model.dart";
import "package:flutter_teste_omni/models/user/user_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "task_model.freezed.dart";
part "task_model.g.dart";

@freezed
sealed class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    String? description,
    List<TeamModel>? teams,
    List<UserModel>? members,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
