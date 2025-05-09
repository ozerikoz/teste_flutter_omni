import "package:flutter_teste_omni/models/team/team_model.dart";
import "package:flutter_teste_omni/models/user/user_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "task_model.freezed.dart";
part "task_model.g.dart";

@freezed
sealed class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    String? description,
    List<Team>? teams,
    List<User>? members,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
