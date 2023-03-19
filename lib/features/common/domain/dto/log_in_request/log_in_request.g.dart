// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInRequest _$LogInRequestFromJson(Map<String, dynamic> json) => LogInRequest(
      name: json['name'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LogInRequestToJson(LogInRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
    };
