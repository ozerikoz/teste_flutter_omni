// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardModel {
  String get id;
  String get title;
  List<UserModel> get members;
  List<TeamModel> get teams;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoardModelCopyWith<BoardModel> get copyWith =>
      _$BoardModelCopyWithImpl<BoardModel>(this as BoardModel, _$identity);

  /// Serializes this BoardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.teams, teams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(teams));

  @override
  String toString() {
    return 'BoardModel(id: $id, title: $title, members: $members, teams: $teams)';
  }
}

/// @nodoc
abstract mixin class $BoardModelCopyWith<$Res> {
  factory $BoardModelCopyWith(
          BoardModel value, $Res Function(BoardModel) _then) =
      _$BoardModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      List<UserModel> members,
      List<TeamModel> teams});
}

/// @nodoc
class _$BoardModelCopyWithImpl<$Res> implements $BoardModelCopyWith<$Res> {
  _$BoardModelCopyWithImpl(this._self, this._then);

  final BoardModel _self;
  final $Res Function(BoardModel) _then;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? members = null,
    Object? teams = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      teams: null == teams
          ? _self.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BoardModel implements BoardModel {
  const _BoardModel(
      {required this.id,
      required this.title,
      required final List<UserModel> members,
      required final List<TeamModel> teams})
      : _members = members,
        _teams = teams;
  factory _BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<UserModel> _members;
  @override
  List<UserModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<TeamModel> _teams;
  @override
  List<TeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoardModelCopyWith<_BoardModel> get copyWith =>
      __$BoardModelCopyWithImpl<_BoardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BoardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoardModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_teams));

  @override
  String toString() {
    return 'BoardModel(id: $id, title: $title, members: $members, teams: $teams)';
  }
}

/// @nodoc
abstract mixin class _$BoardModelCopyWith<$Res>
    implements $BoardModelCopyWith<$Res> {
  factory _$BoardModelCopyWith(
          _BoardModel value, $Res Function(_BoardModel) _then) =
      __$BoardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<UserModel> members,
      List<TeamModel> teams});
}

/// @nodoc
class __$BoardModelCopyWithImpl<$Res> implements _$BoardModelCopyWith<$Res> {
  __$BoardModelCopyWithImpl(this._self, this._then);

  final _BoardModel _self;
  final $Res Function(_BoardModel) _then;

  /// Create a copy of BoardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? members = null,
    Object? teams = null,
  }) {
    return _then(_BoardModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      teams: null == teams
          ? _self._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
    ));
  }
}

// dart format on
