// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LobbyID _$LobbyIDFromJson(Map<String, dynamic> json) {
  return _LobbyID.fromJson(json);
}

/// @nodoc
mixin _$LobbyID {
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LobbyIDCopyWith<LobbyID> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LobbyIDCopyWith<$Res> {
  factory $LobbyIDCopyWith(LobbyID value, $Res Function(LobbyID) then) =
      _$LobbyIDCopyWithImpl<$Res, LobbyID>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$LobbyIDCopyWithImpl<$Res, $Val extends LobbyID>
    implements $LobbyIDCopyWith<$Res> {
  _$LobbyIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LobbyIDCopyWith<$Res> implements $LobbyIDCopyWith<$Res> {
  factory _$$_LobbyIDCopyWith(
          _$_LobbyID value, $Res Function(_$_LobbyID) then) =
      __$$_LobbyIDCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_LobbyIDCopyWithImpl<$Res>
    extends _$LobbyIDCopyWithImpl<$Res, _$_LobbyID>
    implements _$$_LobbyIDCopyWith<$Res> {
  __$$_LobbyIDCopyWithImpl(_$_LobbyID _value, $Res Function(_$_LobbyID) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_LobbyID(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LobbyID extends _LobbyID {
  const _$_LobbyID(this.value) : super._();

  factory _$_LobbyID.fromJson(Map<String, dynamic> json) =>
      _$$_LobbyIDFromJson(json);

  @override
  final String value;

  @override
  String toString() {
    return 'LobbyID(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LobbyID &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LobbyIDCopyWith<_$_LobbyID> get copyWith =>
      __$$_LobbyIDCopyWithImpl<_$_LobbyID>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LobbyIDToJson(
      this,
    );
  }
}

abstract class _LobbyID extends LobbyID {
  const factory _LobbyID(final String value) = _$_LobbyID;
  const _LobbyID._() : super._();

  factory _LobbyID.fromJson(Map<String, dynamic> json) = _$_LobbyID.fromJson;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_LobbyIDCopyWith<_$_LobbyID> get copyWith =>
      throw _privateConstructorUsedError;
}
