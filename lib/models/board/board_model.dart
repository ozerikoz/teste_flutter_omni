import "package:flutter_teste_omni/models/team/team_model.dart";
import "package:flutter_teste_omni/models/user/user_model.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "board_model.freezed.dart";
part "board_model.g.dart";

@freezed
sealed class Board with _$Board {
  const factory Board({
    required String id,
    required String title,
    required List<User> members,
    required List<Team> teams,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
