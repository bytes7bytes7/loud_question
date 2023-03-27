import 'package:injectable/injectable.dart';

import '../../../../repositories/interfaces/game_repository.dart';
import '../../../common/domain/domain.dart';
import '../dto/give_answer_request/give_answer_request.dart';
import '../dto/set_leader_request/set_leader_request.dart';
import '../providers/game_provider.dart';
import '../value_objects/game_state/game_state.dart';

@singleton
class GameService {
  const GameService({
    required GameRepository gameRepository,
    required GameProvider gameProvider,
  })  : _gameRepository = gameRepository,
        _gameProvider = gameProvider;

  final GameRepository _gameRepository;
  final GameProvider _gameProvider;

  Future<GameState> get({
    required LobbyID id,
    bool cached = true,
  }) async {
    if (cached) {
      final saved = await _gameRepository.get(id: id);

      if (saved != null) {
        return saved;
      }
    }

    try {
      final loaded = await _gameProvider.getState(id.str);

      return loaded.value.fold(
        (l) {
          throw Exception('Can not get game state');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({
    required GameState gameState,
  }) async {
    await _gameRepository.update(gameState: gameState);
  }

  Future<GameState> setLeader({
    required LobbyID id,
    required UserID userID,
  }) async {
    try {
      final request = SetLeaderRequest(userID: userID);
      final response = await _gameProvider.setLeader(
        id.str,
        request,
      );

      return await response.value.fold(
        (l) {
          throw Exception('Can not set leader');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> setReady({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.setReady(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not set ready');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> setNotReady({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.setNotReady(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not set notReady');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> startGame({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.startGame(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not start game');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> startAnswer({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.startAnswer(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not start answer');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> giveAnswer({
    required LobbyID id,
    required String answer,
  }) async {
    try {
      final request = GiveAnswerRequest(answer: answer);
      final response = await _gameProvider.giveAnswer(id.str, request);

      return await response.value.fold(
        (l) {
          throw Exception('Can not give answer');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> getAnswer({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.getAnswer(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not get answer');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GameState> restart({
    required LobbyID id,
  }) async {
    try {
      final response = await _gameProvider.restart(id.str);

      return await response.value.fold(
        (l) {
          throw Exception('Can not restart game');
        },
        (r) async {
          await _gameRepository.update(gameState: r.gameState);
          return r.gameState;
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
