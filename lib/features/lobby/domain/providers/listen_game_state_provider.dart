import '../../../common/common.dart';
import '../value_objects/game_state/game_state.dart';

abstract class ListenGameStateProvider
    extends LongPollingProvider<GameState> {
  void setLobbyID(LobbyID id);
}
