// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lobby _$LobbyFromJson(Map<String, dynamic> json) {
  return _Lobby.fromJson(json);
}

/// @nodoc
mixin _$Lobby {
  LobbyID get id => throw _privateConstructorUsedError;
  UserID get creatorID => throw _privateConstructorUsedError;
  int get createdAtInMSSinceEpoch => throw _privateConstructorUsedError;
  List<UserID> get guestIDs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyCopyWith<Lobby> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyCopyWith<$Res> {
  factory $LobbyCopyWith(Lobby value, $Res Function(Lobby) then) =
      _$LobbyCopyWithImpl<$Res, Lobby>;
  @useResult
  $Res call(
      {LobbyID id,
      UserID creatorID,
      int createdAtInMSSinceEpoch,
      List<UserID> guestIDs});

  $LobbyIDCopyWith<$Res> get id;
  $UserIDCopyWith<$Res> get creatorID;
}

/// @nodoc
class _$LobbyCopyWithImpl<$Res, $Val extends Lobby>
    implements $LobbyCopyWith<$Res> {
  _$LobbyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorID = null,
    Object? createdAtInMSSinceEpoch = null,
    Object? guestIDs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as LobbyID,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as UserID,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guestIDs: null == guestIDs
          ? _value.guestIDs
          : guestIDs // ignore: cast_nullable_to_non_nullable
              as List<UserID>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LobbyIDCopyWith<$Res> get id {
    return $LobbyIDCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIDCopyWith<$Res> get creatorID {
    return $UserIDCopyWith<$Res>(_value.creatorID, (value) {
      return _then(_value.copyWith(creatorID: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LobbyCopyWith<$Res> implements $LobbyCopyWith<$Res> {
  factory _$$_LobbyCopyWith(_$_Lobby value, $Res Function(_$_Lobby) then) =
      __$$_LobbyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LobbyID id,
      UserID creatorID,
      int createdAtInMSSinceEpoch,
      List<UserID> guestIDs});

  @override
  $LobbyIDCopyWith<$Res> get id;
  @override
  $UserIDCopyWith<$Res> get creatorID;
}

/// @nodoc
class __$$_LobbyCopyWithImpl<$Res> extends _$LobbyCopyWithImpl<$Res, _$_Lobby>
    implements _$$_LobbyCopyWith<$Res> {
  __$$_LobbyCopyWithImpl(_$_Lobby _value, $Res Function(_$_Lobby) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorID = null,
    Object? createdAtInMSSinceEpoch = null,
    Object? guestIDs = null,
  }) {
    return _then(_$_Lobby(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as LobbyID,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as UserID,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guestIDs: null == guestIDs
          ? _value._guestIDs
          : guestIDs // ignore: cast_nullable_to_non_nullable
              as List<UserID>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lobby implements _Lobby {
  const _$_Lobby(
      {required this.id,
      required this.creatorID,
      required this.createdAtInMSSinceEpoch,
      required final List<UserID> guestIDs})
      : _guestIDs = guestIDs;

  factory _$_Lobby.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyFromJson(json);

  @override
  final LobbyID id;
  @override
  final UserID creatorID;
  @override
  final int createdAtInMSSinceEpoch;
  final List<UserID> _guestIDs;
  @override
  List<UserID> get guestIDs {
    if (_guestIDs is EqualUnmodifiableListView) return _guestIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestIDs);
  }

  @override
  String toString() {
    return 'Lobby(id: $id, creatorID: $creatorID, createdAtInMSSinceEpoch: $createdAtInMSSinceEpoch, guestIDs: $guestIDs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lobby &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorID, creatorID) ||
                other.creatorID == creatorID) &&
            (identical(
                    other.createdAtInMSSinceEpoch, createdAtInMSSinceEpoch) ||
                other.createdAtInMSSinceEpoch == createdAtInMSSinceEpoch) &&
            const DeepCollectionEquality().equals(other._guestIDs, _guestIDs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, creatorID,
      createdAtInMSSinceEpoch, const DeepCollectionEquality().hash(_guestIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      __$$_LobbyCopyWithImpl<_$_Lobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyToJson(
      this,
    );
  }
}

abstract class _Lobby implements Lobby {
  const factory _Lobby(
      {required final LobbyID id,
      required final UserID creatorID,
      required final int createdAtInMSSinceEpoch,
      required final List<UserID> guestIDs}) = _$_Lobby;

  factory _Lobby.fromJson(Map<String, dynamic> json) = _$_Lobby.fromJson;

  @override
  LobbyID get id;
  @override
  UserID get creatorID;
  @override
  int get createdAtInMSSinceEpoch;
  @override
  List<UserID> get guestIDs;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyCopyWith<_$_Lobby> get copyWith =>
      throw _privateConstructorUsedError;
}
