import "package:freezed_annotation/freezed_annotation.dart";

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    String? imageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
