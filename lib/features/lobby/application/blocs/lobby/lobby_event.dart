part of 'lobby_bloc.dart';

abstract class LobbyEvent extends Equatable {
  const LobbyEvent();

  @override
  List<Object?> get props => [];
}

class LoadLobbyEvent extends LobbyEvent {
  const LoadLobbyEvent();
}
