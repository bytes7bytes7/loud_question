// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAnswer _$UserAnswerFromJson(Map<String, dynamic> json) {
  return _UserAnswer.fromJson(json);
}

/// @nodoc
mixin _$UserAnswer {
  UserID get userID => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAnswerCopyWith<UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswerCopyWith<$Res> {
  factory $UserAnswerCopyWith(
          UserAnswer value, $Res Function(UserAnswer) then) =
      _$UserAnswerCopyWithImpl<$Res, UserAnswer>;
  @useResult
  $Res call({UserID userID, String answer});

  $UserIDCopyWith<$Res> get userID;
}

/// @nodoc
class _$UserAnswerCopyWithImpl<$Res, $Val extends UserAnswer>
    implements $UserAnswerCopyWith<$Res> {
  _$UserAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UserID,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIDCopyWith<$Res> get userID {
    return $UserIDCopyWith<$Res>(_value.userID, (value) {
      return _then(_value.copyWith(userID: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserAnswerCopyWith<$Res>
    implements $UserAnswerCopyWith<$Res> {
  factory _$$_UserAnswerCopyWith(
          _$_UserAnswer value, $Res Function(_$_UserAnswer) then) =
      __$$_UserAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserID userID, String answer});

  @override
  $UserIDCopyWith<$Res> get userID;
}

/// @nodoc
class __$$_UserAnswerCopyWithImpl<$Res>
    extends _$UserAnswerCopyWithImpl<$Res, _$_UserAnswer>
    implements _$$_UserAnswerCopyWith<$Res> {
  __$$_UserAnswerCopyWithImpl(
      _$_UserAnswer _value, $Res Function(_$_UserAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? answer = null,
  }) {
    return _then(_$_UserAnswer(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UserID,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAnswer implements _UserAnswer {
  const _$_UserAnswer({required this.userID, required this.answer});

  factory _$_UserAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_UserAnswerFromJson(json);

  @override
  final UserID userID;
  @override
  final String answer;

  @override
  String toString() {
    return 'UserAnswer(userID: $userID, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAnswer &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userID, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAnswerCopyWith<_$_UserAnswer> get copyWith =>
      __$$_UserAnswerCopyWithImpl<_$_UserAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAnswerToJson(
      this,
    );
  }
}

abstract class _UserAnswer implements UserAnswer {
  const factory _UserAnswer(
      {required final UserID userID,
      required final String answer}) = _$_UserAnswer;

  factory _UserAnswer.fromJson(Map<String, dynamic> json) =
      _$_UserAnswer.fromJson;

  @override
  UserID get userID;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_UserAnswerCopyWith<_$_UserAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}
