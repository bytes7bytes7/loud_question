import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/dto.dart';

abstract class HomeProvider {
  Future<JsonEitherWrapper<ProblemDetails, GetLobbiesResponse>> getLobbies();

  Future<JsonEitherWrapper<ProblemDetails, CreateLobbyResponse>> createLobby(
    CreateLobbyRequest request,
  );

  Future<JsonEitherWrapper<ProblemDetails, JoinLobbyResponse>> joinLobby(
    String id,
    JoinLobbyRequest request,
  );

  Future<JsonEitherWrapper<ProblemDetails, GetSongResponse>> getSong();
}
