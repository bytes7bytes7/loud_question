import 'package:injectable/injectable.dart';

import '../../../../repositories/interfaces/interfaces.dart';
import '../../../common/domain/domain.dart';
import '../providers/lobby_provider.dart';

@singleton
class LobbyService {
  const LobbyService({
    required LobbyRepository lobbyRepository,
    required LobbyProvider lobbyProvider,
  })  : _lobbyRepository = lobbyRepository,
        _lobbyProvider = lobbyProvider;

  final LobbyRepository _lobbyRepository;
  final LobbyProvider _lobbyProvider;

  Future<Lobby> get({
    required LobbyID lobbyID,
    bool cached = true,
  }) async {
    if (cached) {
      final saved = await _lobbyRepository.get(lobbyID: lobbyID);

      if (saved != null) {
        return saved;
      }
    }

    try {
      final loaded = await _lobbyProvider.getLobby(lobbyID.str);

      return loaded.value.fold(
        (l) {
          throw Exception('Can not get lobby');
        },
        (r) async {
          await _lobbyRepository.update(lobby: r.lobby);
          return r.lobby;
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update({
    required Lobby lobby,
  }) async {
    await _lobbyRepository.update(lobby: lobby);
  }
}
