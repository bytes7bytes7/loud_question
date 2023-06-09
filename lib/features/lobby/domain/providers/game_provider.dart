import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/game_state_response/game_state_response.dart';
import '../dto/give_answer_request/give_answer_request.dart';
import '../dto/set_leader_request/set_leader_request.dart';

abstract class GameProvider {
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getState(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> listenState(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setLeader(
    String id,
    SetLeaderRequest request,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setReady(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setNotReady(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startGame(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> changeQuestion(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startAnswer(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> giveAnswer(
    String id,
    GiveAnswerRequest request,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getAnswer(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> restart(
    String id,
  );
}
