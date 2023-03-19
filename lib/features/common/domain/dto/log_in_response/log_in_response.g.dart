// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInResponse _$LogInResponseFromJson(Map<String, dynamic> json) =>
    LogInResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LogInResponseToJson(LogInResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
