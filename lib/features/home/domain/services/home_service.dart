import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../../../common/application/application.dart';
import '../../../common/domain/entities/lobby/lobby.dart';
import '../dto/dto.dart';
import '../providers/home_provider.dart';

@singleton
class HomeService {
  const HomeService({
    required HomeProvider homeProvider,
  }) : _homeProvider = homeProvider;

  final HomeProvider _homeProvider;

  Future<List<Lobby>> load() async {
    late JsonEitherWrapper<ProblemDetails, GetLobbiesResponse> response;

    try {
      response = await _homeProvider.getLobbies();
    } catch (e) {
      throw Exception();
    }

    return response.value.fold(
      (l) {
        throw Exception();
      },
      (r) {
        return r.lobbies;
      },
    );
  }

  Future<Lobby> createLobby({
    required String password,
  }) async {
    final request = CreateLobbyRequest(password: password);

    late JsonEitherWrapper<ProblemDetails, CreateLobbyResponse> response;
    try {
      response = await _homeProvider.createLobby(request);
    } catch (e) {
      throw Exception();
    }

    return response.value.fold(
      (l) {
        throw Exception();
      },
      (r) {
        return r.lobby;
      },
    );
  }

  Future<Lobby> joinLobby({
    required String id,
    required String password,
  }) async {
    final request = JoinLobbyRequest(password: password);

    late JsonEitherWrapper<ProblemDetails, JoinLobbyResponse> response;
    try {
      response = await _homeProvider.joinLobby(id, request);
    } catch (e) {
      throw Exception();
    }

    return response.value.fold(
      (l) {
        if (l.title == 'Lobby with provided ID does not exist.') {
          throw const LobbyDoesNotExist();
        } else if (l.title ==
            'Provided password is incorrect for lobby with provided ID.') {
          throw const WrongLobbyPassword();
        } else if (l.title == 'You have already joint this lobby.') {
          throw const YouAlreadyJointLobby();
        } else {
          throw Exception();
        }
      },
      (r) {
        return r.lobby;
      },
    );
  }
}
