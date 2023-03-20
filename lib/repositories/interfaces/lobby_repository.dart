import '../../features/common/domain/domain.dart';

abstract class LobbyRepository {
  Future<Lobby?> get({required LobbyID lobbyID});

  Future<void> update({required Lobby lobby});
}
