import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../../../common/domain/domain.dart';
import '../../domain/dto/listen_lobby_response/listen_lobby_response.dart';
import '../../domain/providers/listen_lobby_provider.dart';
import '../../domain/providers/lobby_provider.dart';

@Injectable(as: ListenLobbyProvider)
class ProdListenLobbyProvider implements ListenLobbyProvider {
  ProdListenLobbyProvider({
    required LobbyProvider lobbyProvider,
  }) : _lobbyProvider = lobbyProvider;

  final LobbyProvider _lobbyProvider;

  late LobbyID _lobbyID;

  var _working = false;
  final _controller = StreamController<Lobby>.broadcast();

  @override
  void setLobbyID(LobbyID id) {
    _lobbyID = id;
  }

  @override
  void start() {
    _working = true;
    _work();
  }

  @override
  void stop() {
    _working = false;
    _controller.close();
  }

  @override
  Stream<Lobby> get stream => _controller.stream;

  Future<void> _work() async {
    while (_working) {
      final id = _lobbyID.str;
      JsonEitherWrapper<ProblemDetails, ListenLobbyResponse>? response;
      try {
        response = await _lobbyProvider.listenLobby(id);
      } catch (e) {
        //
      }

      if (id == _lobbyID.str && _working && response != null) {
        response.value.fold(
          (l) {
            if (l.status == 401) {
              stop();
            }
          },
          (r) {
            if (!_controller.isClosed) {
              _controller.add(r.lobby);
            }
          },
        );
      }
    }
  }
}
