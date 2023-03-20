import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/get_game_state_response/get_game_state_response.dart';

abstract class GameProvider {
  Future<JsonEitherWrapper<ProblemDetails, GetGameStateResponse>> getState(
    String id,
  );
}
