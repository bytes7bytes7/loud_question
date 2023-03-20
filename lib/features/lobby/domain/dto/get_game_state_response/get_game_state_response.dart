import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../value_objects/game_state/game_state.dart';

part 'get_game_state_response.g.dart';

@JsonSerializable()
class GetGameStateResponse {
  const GetGameStateResponse({
    required this.gameState,
  });

  final GameState gameState;

  factory GetGameStateResponse.fromJson(JsonMap json) =>
      _$GetGameStateResponseFromJson(json);

  JsonMap toJson() => _$GetGameStateResponseToJson(this);
}
