// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_vm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserVM {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isMe => throw _privateConstructorUsedError;
  bool get isCreator => throw _privateConstructorUsedError;
  bool get isLeader => throw _privateConstructorUsedError;
  UserState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserVMCopyWith<UserVM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVMCopyWith<$Res> {
  factory $UserVMCopyWith(UserVM value, $Res Function(UserVM) then) =
      _$UserVMCopyWithImpl<$Res, UserVM>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool isMe,
      bool isCreator,
      bool isLeader,
      UserState state});
}

/// @nodoc
class _$UserVMCopyWithImpl<$Res, $Val extends UserVM>
    implements $UserVMCopyWith<$Res> {
  _$UserVMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isMe = null,
    Object? isCreator = null,
    Object? isLeader = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreator: null == isCreator
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserVMCopyWith<$Res> implements $UserVMCopyWith<$Res> {
  factory _$$_UserVMCopyWith(_$_UserVM value, $Res Function(_$_UserVM) then) =
      __$$_UserVMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool isMe,
      bool isCreator,
      bool isLeader,
      UserState state});
}

/// @nodoc
class __$$_UserVMCopyWithImpl<$Res>
    extends _$UserVMCopyWithImpl<$Res, _$_UserVM>
    implements _$$_UserVMCopyWith<$Res> {
  __$$_UserVMCopyWithImpl(_$_UserVM _value, $Res Function(_$_UserVM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isMe = null,
    Object? isCreator = null,
    Object? isLeader = null,
    Object? state = null,
  }) {
    return _then(_$_UserVM(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isMe: null == isMe
          ? _value.isMe
          : isMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreator: null == isCreator
          ? _value.isCreator
          : isCreator // ignore: cast_nullable_to_non_nullable
              as bool,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

class _$_UserVM implements _UserVM {
  const _$_UserVM(
      {required this.id,
      required this.name,
      required this.isMe,
      required this.isCreator,
      required this.isLeader,
      required this.state});

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isMe;
  @override
  final bool isCreator;
  @override
  final bool isLeader;
  @override
  final UserState state;

  @override
  String toString() {
    return 'UserVM(id: $id, name: $name, isMe: $isMe, isCreator: $isCreator, isLeader: $isLeader, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserVM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.isCreator, isCreator) ||
                other.isCreator == isCreator) &&
            (identical(other.isLeader, isLeader) ||
                other.isLeader == isLeader) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, isMe, isCreator, isLeader, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserVMCopyWith<_$_UserVM> get copyWith =>
      __$$_UserVMCopyWithImpl<_$_UserVM>(this, _$identity);
}

abstract class _UserVM implements UserVM {
  const factory _UserVM(
      {required final String id,
      required final String name,
      required final bool isMe,
      required final bool isCreator,
      required final bool isLeader,
      required final UserState state}) = _$_UserVM;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isMe;
  @override
  bool get isCreator;
  @override
  bool get isLeader;
  @override
  UserState get state;
  @override
  @JsonKey(ignore: true)
  _$$_UserVMCopyWith<_$_UserVM> get copyWith =>
      throw _privateConstructorUsedError;
}
