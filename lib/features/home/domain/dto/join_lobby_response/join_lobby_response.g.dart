// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_lobby_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinLobbyResponse _$JoinLobbyResponseFromJson(Map<String, dynamic> json) =>
    JoinLobbyResponse(
      lobby: Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinLobbyResponseToJson(JoinLobbyResponse instance) =>
    <String, dynamic>{
      'lobby': instance.lobby,
    };
