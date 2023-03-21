import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/game_state_response/game_state_response.dart';

@Singleton(as: JsonConverter<GameStateResponse, JsonMap>)
class GameStateResponseJsonConverter
    extends JsonConverter<GameStateResponse, JsonMap> {
  const GameStateResponseJsonConverter();

  @override
  GameStateResponse fromJson(JsonMap json) {
    return GameStateResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GameStateResponse object) {
    return object.toJson();
  }
}
