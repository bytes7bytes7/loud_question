import '../../../common/domain/domain.dart';

abstract class ListenLobbyProvider extends LongPollingProvider<Lobby> {
  void setLobbyID(LobbyID id);
}
