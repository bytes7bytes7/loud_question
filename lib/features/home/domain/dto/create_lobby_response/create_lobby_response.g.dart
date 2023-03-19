// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lobby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLobbyResponse _$CreateLobbyResponseFromJson(Map<String, dynamic> json) =>
    CreateLobbyResponse(
      lobby: Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateLobbyResponseToJson(
        CreateLobbyResponse instance) =>
    <String, dynamic>{
      'lobby': instance.lobby,
    };
