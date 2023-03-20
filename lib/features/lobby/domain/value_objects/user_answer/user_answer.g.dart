// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAnswer _$$_UserAnswerFromJson(Map<String, dynamic> json) =>
    _$_UserAnswer(
      userID: UserID.fromJson(json['userID'] as Map<String, dynamic>),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$$_UserAnswerToJson(_$_UserAnswer instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'answer': instance.answer,
    };
