// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listen_lobby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListenLobbyResponse _$ListenLobbyResponseFromJson(Map<String, dynamic> json) =>
    ListenLobbyResponse(
      lobby: Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListenLobbyResponseToJson(
        ListenLobbyResponse instance) =>
    <String, dynamic>{
      'lobby': instance.lobby,
    };
