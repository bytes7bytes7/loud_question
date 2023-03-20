// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_info_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LobbyInfoVM {
  String get id => throw _privateConstructorUsedError;
  UserVM get me => throw _privateConstructorUsedError;
  UserVM get creator => throw _privateConstructorUsedError;
  int get createdAtInMSSinceEpoch => throw _privateConstructorUsedError;
  List<UserVM> get guests => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LobbyInfoVMCopyWith<LobbyInfoVM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyInfoVMCopyWith<$Res> {
  factory $LobbyInfoVMCopyWith(
          LobbyInfoVM value, $Res Function(LobbyInfoVM) then) =
      _$LobbyInfoVMCopyWithImpl<$Res, LobbyInfoVM>;
  @useResult
  $Res call(
      {String id,
      UserVM me,
      UserVM creator,
      int createdAtInMSSinceEpoch,
      List<UserVM> guests});

  $UserVMCopyWith<$Res> get me;
  $UserVMCopyWith<$Res> get creator;
}

/// @nodoc
class _$LobbyInfoVMCopyWithImpl<$Res, $Val extends LobbyInfoVM>
    implements $LobbyInfoVMCopyWith<$Res> {
  _$LobbyInfoVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? me = null,
    Object? creator = null,
    Object? createdAtInMSSinceEpoch = null,
    Object? guests = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      me: null == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as UserVM,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserVM,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guests: null == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<UserVM>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserVMCopyWith<$Res> get me {
    return $UserVMCopyWith<$Res>(_value.me, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserVMCopyWith<$Res> get creator {
    return $UserVMCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LobbyInfoVMCopyWith<$Res>
    implements $LobbyInfoVMCopyWith<$Res> {
  factory _$$_LobbyInfoVMCopyWith(
          _$_LobbyInfoVM value, $Res Function(_$_LobbyInfoVM) then) =
      __$$_LobbyInfoVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserVM me,
      UserVM creator,
      int createdAtInMSSinceEpoch,
      List<UserVM> guests});

  @override
  $UserVMCopyWith<$Res> get me;
  @override
  $UserVMCopyWith<$Res> get creator;
}

/// @nodoc
class __$$_LobbyInfoVMCopyWithImpl<$Res>
    extends _$LobbyInfoVMCopyWithImpl<$Res, _$_LobbyInfoVM>
    implements _$$_LobbyInfoVMCopyWith<$Res> {
  __$$_LobbyInfoVMCopyWithImpl(
      _$_LobbyInfoVM _value, $Res Function(_$_LobbyInfoVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? me = null,
    Object? creator = null,
    Object? createdAtInMSSinceEpoch = null,
    Object? guests = null,
  }) {
    return _then(_$_LobbyInfoVM(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      me: null == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as UserVM,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserVM,
      createdAtInMSSinceEpoch: null == createdAtInMSSinceEpoch
          ? _value.createdAtInMSSinceEpoch
          : createdAtInMSSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      guests: null == guests
          ? _value._guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<UserVM>,
    ));
  }
}

/// @nodoc

class _$_LobbyInfoVM implements _LobbyInfoVM {
  const _$_LobbyInfoVM(
      {required this.id,
      required this.me,
      required this.creator,
      required this.createdAtInMSSinceEpoch,
      required final List<UserVM> guests})
      : _guests = guests;

  @override
  final String id;
  @override
  final UserVM me;
  @override
  final UserVM creator;
  @override
  final int createdAtInMSSinceEpoch;
  final List<UserVM> _guests;
  @override
  List<UserVM> get guests {
    if (_guests is EqualUnmodifiableListView) return _guests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guests);
  }

  @override
  String toString() {
    return 'LobbyInfoVM(id: $id, me: $me, creator: $creator, createdAtInMSSinceEpoch: $createdAtInMSSinceEpoch, guests: $guests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LobbyInfoVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(
                    other.createdAtInMSSinceEpoch, createdAtInMSSinceEpoch) ||
                other.createdAtInMSSinceEpoch == createdAtInMSSinceEpoch) &&
            const DeepCollectionEquality().equals(other._guests, _guests));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, me, creator,
      createdAtInMSSinceEpoch, const DeepCollectionEquality().hash(_guests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LobbyInfoVMCopyWith<_$_LobbyInfoVM> get copyWith =>
      __$$_LobbyInfoVMCopyWithImpl<_$_LobbyInfoVM>(this, _$identity);
}

abstract class _LobbyInfoVM implements LobbyInfoVM {
  const factory _LobbyInfoVM(
      {required final String id,
      required final UserVM me,
      required final UserVM creator,
      required final int createdAtInMSSinceEpoch,
      required final List<UserVM> guests}) = _$_LobbyInfoVM;

  @override
  String get id;
  @override
  UserVM get me;
  @override
  UserVM get creator;
  @override
  int get createdAtInMSSinceEpoch;
  @override
  List<UserVM> get guests;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyInfoVMCopyWith<_$_LobbyInfoVM> get copyWith =>
      throw _privateConstructorUsedError;
}
