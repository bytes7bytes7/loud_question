import '../../../common/common.dart';
import '../dto/game_state_response/game_state_response.dart';

abstract class ListenGameStateProvider
    implements LongPollingProvider<GameStateResponse> {
  void setLobbyID(LobbyID id);
}
