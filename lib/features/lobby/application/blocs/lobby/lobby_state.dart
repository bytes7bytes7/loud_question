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
