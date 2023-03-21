part of 'lobby_bloc.dart';

abstract class LobbyEvent extends Equatable {
  const LobbyEvent();

  @override
  List<Object?> get props => [];
}

class LoadLobbyEvent extends LobbyEvent {
  const LoadLobbyEvent({
    required this.cached,
  });

  final bool cached;

  @override
  List<Object?> get props => [cached];
}

class SetLeaderLobbyEvent extends LobbyEvent {
  const SetLeaderLobbyEvent({
    required this.userID,
  });

  final String userID;

  @override
  List<Object?> get props => [userID];
}

class SetReadyLobbyEvent extends LobbyEvent {
  const SetReadyLobbyEvent();
}

class SetNotReadyLobbyEvent extends LobbyEvent {
  const SetNotReadyLobbyEvent();
}

class StartGameLobbyEvent extends LobbyEvent {
  const StartGameLobbyEvent();
}

class StartAnswerLobbyEvent extends LobbyEvent {
  const StartAnswerLobbyEvent();
}

class AnswerLobbyEvent extends LobbyEvent {
  const AnswerLobbyEvent({
    required this.answer,
  });

  final String answer;

  @override
  List<Object?> get props => [answer];
}

class CheckAnswerLobbyEvent extends LobbyEvent {
  const CheckAnswerLobbyEvent();
}

class RestartLobbyEvent extends LobbyEvent {
  const RestartLobbyEvent();
}

class _ProcessGameStateLobbyEvent extends LobbyEvent {
  const _ProcessGameStateLobbyEvent({
    required this.gameState,
  });

  final GameState gameState;

  @override
  List<Object?> get props => [gameState];
}

class _UpdateTimeLobbyEvent extends LobbyEvent {
  const _UpdateTimeLobbyEvent({
    required this.secondsLeft,
  });

  final int? secondsLeft;

  @override
  List<Object?> get props => [secondsLeft];
}
