import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';

import '../../../../utils/json_either_wrapper.dart';
import '../../../common/domain/domain.dart';
import '../../domain/dto/game_state_response/game_state_response.dart';
import '../../domain/providers/game_provider.dart';
import '../../domain/providers/listen_game_state_provider.dart';

@Injectable(as: ListenGameStateProvider)
class ProdListenGameStateProvider implements ListenGameStateProvider {
  ProdListenGameStateProvider({
    required GameProvider gameProvider,
  }) : _gameProvider = gameProvider;

  late LobbyID _lobbyID;
  final GameProvider _gameProvider;

  var _working = false;
  final _controller = StreamController<GameStateResponse>.broadcast();

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
  Stream<GameStateResponse> get stream => _controller.stream;

  Future<void> _work() async {
    while (_working) {
      final id = _lobbyID.str;
      JsonEitherWrapper<ProblemDetails, GameStateResponse>? response;
      try {
        response = await _gameProvider.listenState(id);
      } catch (e) {
        //
      }

      if (id == _lobbyID.str && _working && response != null) {
        final result = response.value.getRight().toNullable();
        if (result != null) {
          if (!_controller.isClosed) {
            _controller.add(result);
          }
        }
      }
    }
  }
}
