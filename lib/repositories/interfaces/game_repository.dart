import '../../features/common/domain/domain.dart';
import '../../features/lobby/domain/domain.dart';

abstract class GameRepository {
  Future<GameState?> get({required LobbyID id});

  Future<void> update({required GameState gameState});
}
