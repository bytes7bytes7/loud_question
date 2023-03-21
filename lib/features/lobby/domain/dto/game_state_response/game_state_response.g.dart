// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStateResponse _$GameStateResponseFromJson(Map<String, dynamic> json) =>
    GameStateResponse(
      gameState: GameState.fromJson(json['gameState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameStateResponseToJson(GameStateResponse instance) =>
    <String, dynamic>{
      'gameState': instance.gameState,
    };
