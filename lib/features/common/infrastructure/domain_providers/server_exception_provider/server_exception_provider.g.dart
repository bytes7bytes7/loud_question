// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_exception_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdServerExceptionProvider _$ProdServerExceptionProviderFromJson(
        Map<String, dynamic> json) =>
    ProdServerExceptionProvider(
      nameIsAlreadyInUse: json['name_is_already_in_use'] as String,
      invalidCredentials: json['invalid_credentials'] as String,
    );

Map<String, dynamic> _$ProdServerExceptionProviderToJson(
        ProdServerExceptionProvider instance) =>
    <String, dynamic>{
      'name_is_already_in_use': instance.nameIsAlreadyInUse,
      'invalid_credentials': instance.invalidCredentials,
    };
