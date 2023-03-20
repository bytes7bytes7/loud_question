import 'package:injectable/injectable.dart';

import '../../../../repositories/interfaces/game_repository.dart';
import '../../../common/domain/domain.dart';
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

  Future<void> update({required GameState gameState}) async {}
}
