// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamModel {
  String get id;
  String get name;
  int get colorArgb;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<TeamModel> get copyWith =>
      _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TeamModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorArgb, colorArgb) ||
                other.colorArgb == colorArgb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorArgb);

  @override
  String toString() {
    return 'TeamModel(id: $id, name: $name, colorArgb: $colorArgb)';
  }
}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res> {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) =
      _$TeamModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, int colorArgb});
}

/// @nodoc
class _$TeamModelCopyWithImpl<$Res> implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorArgb = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorArgb: null == colorArgb
          ? _self.colorArgb
          : colorArgb // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TeamModel implements TeamModel {
  const _TeamModel(
      {required this.id, required this.name, required this.colorArgb});
  factory _TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int colorArgb;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TeamModelCopyWith<_TeamModel> get copyWith =>
      __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TeamModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorArgb, colorArgb) ||
                other.colorArgb == colorArgb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, colorArgb);

  @override
  String toString() {
    return 'TeamModel(id: $id, name: $name, colorArgb: $colorArgb)';
  }
}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res>
    implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(
          _TeamModel value, $Res Function(_TeamModel) _then) =
      __$TeamModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, int colorArgb});
}

/// @nodoc
class __$TeamModelCopyWithImpl<$Res> implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

  /// Create a copy of TeamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? colorArgb = null,
  }) {
    return _then(_TeamModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorArgb: null == colorArgb
          ? _self.colorArgb
          : colorArgb // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
