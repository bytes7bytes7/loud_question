// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_leader_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetLeaderRequest _$SetLeaderRequestFromJson(Map<String, dynamic> json) =>
    SetLeaderRequest(
      userID: UserID.fromJson(json['userID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetLeaderRequestToJson(SetLeaderRequest instance) =>
    <String, dynamic>{
      'userID': instance.userID,
    };
