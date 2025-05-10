import "package:flutter_teste_omni/models/task/task_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "board_column_model.freezed.dart";
part "board_column_model.g.dart";

@freezed
sealed class BoardColumnModel with _$BoardColumnModel {
  const factory BoardColumnModel({
    required String id,
    required String title,
    required List<TaskModel> tasks,
  }) = _BoardColumnModel;

  factory BoardColumnModel.fromJson(Map<String, dynamic> json) =>
      _$BoardColumnModelFromJson(json);
}
