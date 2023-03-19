// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LobbyVM {
  String get id => throw _privateConstructorUsedError;
  String get creatorID => throw _privateConstructorUsedError;
  int get createdAtInMSSinceEpoch => throw _privateConstructorUsedError;
  List<String> get guestIDs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LobbyVMCopyWith<LobbyVM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyVMCopyWith<$Res> {
  factory $LobbyVMCopyWith(LobbyVM value, $Res Function(LobbyVM) then) =
      _$LobbyVMCopyWithImpl<$Res, LobbyVM>;
  @useResult
  $Res call(
      {String id,
      String creatorID,
      int createdAtInMSSinceEpoch,
      List<String> guestIDs});
}

/// @nodoc
class _$LobbyVMCopyWithImpl<$Res, $Val extends LobbyVM>
    implements $LobbyVMCopyWith<$Res> {
  _$LobbyVMCopyWithImpl(this._value, this._then);

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
              as String,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guestIDs: null == guestIDs
          ? _value.guestIDs
          : guestIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LobbyVMCopyWith<$Res> implements $LobbyVMCopyWith<$Res> {
  factory _$$_LobbyVMCopyWith(
          _$_LobbyVM value, $Res Function(_$_LobbyVM) then) =
      __$$_LobbyVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String creatorID,
      int createdAtInMSSinceEpoch,
      List<String> guestIDs});
}

/// @nodoc
class __$$_LobbyVMCopyWithImpl<$Res>
    extends _$LobbyVMCopyWithImpl<$Res, _$_LobbyVM>
    implements _$$_LobbyVMCopyWith<$Res> {
  __$$_LobbyVMCopyWithImpl(_$_LobbyVM _value, $Res Function(_$_LobbyVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatorID = null,
    Object? createdAtInMSSinceEpoch = null,
    Object? guestIDs = null,
  }) {
    return _then(_$_LobbyVM(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatorID: null == creatorID
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guestIDs: null == guestIDs
          ? _value._guestIDs
          : guestIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_LobbyVM implements _LobbyVM {
  const _$_LobbyVM(
      {required this.id,
      required this.creatorID,
      required this.createdAtInMSSinceEpoch,
      required final List<String> guestIDs})
      : _guestIDs = guestIDs;

  @override
  final String id;
  @override
  final String creatorID;
  @override
  final int createdAtInMSSinceEpoch;
  final List<String> _guestIDs;
  @override
  List<String> get guestIDs {
    if (_guestIDs is EqualUnmodifiableListView) return _guestIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guestIDs);
  }

  @override
  String toString() {
    return 'LobbyVM(id: $id, creatorID: $creatorID, createdAtInMSSinceEpoch: $createdAtInMSSinceEpoch, guestIDs: $guestIDs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LobbyVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatorID, creatorID) ||
                other.creatorID == creatorID) &&
            (identical(
                    other.createdAtInMSSinceEpoch, createdAtInMSSinceEpoch) ||
                other.createdAtInMSSinceEpoch == createdAtInMSSinceEpoch) &&
            const DeepCollectionEquality().equals(other._guestIDs, _guestIDs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, creatorID,
      createdAtInMSSinceEpoch, const DeepCollectionEquality().hash(_guestIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LobbyVMCopyWith<_$_LobbyVM> get copyWith =>
      __$$_LobbyVMCopyWithImpl<_$_LobbyVM>(this, _$identity);
}

abstract class _LobbyVM implements LobbyVM {
  const factory _LobbyVM(
      {required final String id,
      required final String creatorID,
      required final int createdAtInMSSinceEpoch,
      required final List<String> guestIDs}) = _$_LobbyVM;

  @override
  String get id;
  @override
  String get creatorID;
  @override
  int get createdAtInMSSinceEpoch;
  @override
  List<String> get guestIDs;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyVMCopyWith<_$_LobbyVM> get copyWith =>
      throw _privateConstructorUsedError;
}
