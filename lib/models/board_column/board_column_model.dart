import "package:flutter_teste_omni/models/task/task_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "board_column_model.freezed.dart";
part "board_column_model.g.dart";

@freezed
sealed class BoardColumn with _$BoardColumn {
  const factory BoardColumn({
    required String id,
    required String title,
    List<Task>? tasks,
  }) = _BoardColumn;

  factory BoardColumn.fromJson(Map<String, dynamic> json) =>
      _$BoardColumnFromJson(json);
}
