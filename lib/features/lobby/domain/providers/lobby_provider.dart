import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../dto/dto.dart';

abstract class LobbyProvider {
  Future<JsonEitherWrapper<ProblemDetails, GetLobbyResponse>> getLobby(
    String id,
  );

  Future<JsonEitherWrapper<ProblemDetails, ListenLobbyResponse>> listenLobby(
    String id,
  );
}
