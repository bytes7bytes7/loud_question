// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lobbies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLobbiesResponse _$GetLobbiesResponseFromJson(Map<String, dynamic> json) =>
    GetLobbiesResponse(
      lobbies: (json['lobbies'] as List<dynamic>)
          .map((e) => Lobby.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLobbiesResponseToJson(GetLobbiesResponse instance) =>
    <String, dynamic>{
      'lobbies': instance.lobbies,
    };
