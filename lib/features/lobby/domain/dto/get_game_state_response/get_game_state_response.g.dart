// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_game_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGameStateResponse _$GetGameStateResponseFromJson(
        Map<String, dynamic> json) =>
    GetGameStateResponse(
      gameState: GameState.fromJson(json['gameState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGameStateResponseToJson(
        GetGameStateResponse instance) =>
    <String, dynamic>{
      'gameState': instance.gameState,
    };
