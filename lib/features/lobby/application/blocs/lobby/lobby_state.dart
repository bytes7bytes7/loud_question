part of 'lobby_bloc.dart';

class LobbyState extends Equatable with Loadable, Errorable {
  const LobbyState({
    this.isLoading = false,
    this.error = '',
    this.lobbyInfo,
    this.gameState,
    this.secondsLeft,
  });

  @override
  final bool isLoading;

  @override
  final String error;

  final LobbyInfoVM? lobbyInfo;

  final GameState? gameState;

  final int? secondsLeft;

  bool get showRestartGameBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state == null || lobby == null) {
      return false;
    }

    return lobby.me.id == state.leaderID.str;
  }

  bool get showSetReadyBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! InitGameState || lobby == null) {
      return false;
    }

    return !state.readyIDs.contains(UserID.fromString(lobby.me.id));
  }

  bool get showSetNotReadyBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! InitGameState || lobby == null) {
      return false;
    }

    return state.readyIDs.contains(UserID.fromString(lobby.me.id));
  }

  bool get showStartGameBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! InitGameState || lobby == null) {
      return false;
    }

    if (lobby.me.id != state.leaderID.str) {
      return false;
    }

    return state.readyIDs.length == lobby.guests.length + 1;
  }

  bool get showChangeQuestionBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! PlayingGameState || lobby == null) {
      return false;
    }

    return lobby.me.id == state.leaderID.str;
  }

  bool get showMoveToAnsweringBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! PlayingGameState || lobby == null) {
      return false;
    }

    if (lobby.me.id != state.leaderID.str) {
      return false;
    }

    return secondsLeft == 0;
  }

  bool get showAnswerTextField {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! WaitingForAnswerGameState || lobby == null) {
      return false;
    }

    return !state.hasAnswered.contains(UserID.fromString(lobby.me.id));
  }

  bool get showRevealRightAnswerBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! WaitingForAnswerGameState || lobby == null) {
      return false;
    }

    if (lobby.me.id != state.leaderID.str) {
      return false;
    }

    return state.hasAnswered.length == lobby.guests.length + 1;
  }

  bool get showPlayAgainBtn {
    final state = gameState;
    final lobby = lobbyInfo;

    if (state is! CheckingAnswerGameState || lobby == null) {
      return false;
    }

    return lobby.me.id == state.leaderID.str;
  }

  LobbyState withLoading() => copyWith(isLoading: true);

  LobbyState withError(String error) =>
      copyWith(error: error, isLoading: false);

  LobbyState withoutError() => copyWith(isLoading: false);

  LobbyState copyWith({
    bool? isLoading,
    String? error = '',
    LobbyInfoVM? lobbyInfo,
    GameState? gameState,
    Wrapper<int>? secondsLeft,
  }) {
    return LobbyState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lobbyInfo: lobbyInfo ?? this.lobbyInfo,
      gameState: gameState ?? this.gameState,
      secondsLeft: secondsLeft != null ? secondsLeft.value : this.secondsLeft,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        lobbyInfo,
        gameState,
        secondsLeft,
      ];
}
