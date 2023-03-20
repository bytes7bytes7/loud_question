// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lobby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLobbyResponse _$GetLobbyResponseFromJson(Map<String, dynamic> json) =>
    GetLobbyResponse(
      lobby: Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetLobbyResponseToJson(GetLobbyResponse instance) =>
    <String, dynamic>{
      'lobby': instance.lobby,
    };
