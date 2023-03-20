part of 'lobby_bloc.dart';

class LobbyState extends Equatable with Loadable, Errorable {
  const LobbyState({
    this.isLoading = false,
    this.error = '',
    this.lobbyInfo,
    this.gameState,
  });

  @override
  final bool isLoading;

  @override
  final String error;

  final LobbyInfoVM? lobbyInfo;

  final GameState? gameState;

  LobbyState withLoading() => copyWith(isLoading: true);

  LobbyState withError(String error) =>
      copyWith(error: error, isLoading: false);

  LobbyState withoutError() => copyWith(isLoading: false);

  LobbyState copyWith({
    bool? isLoading,
    String? error = '',
    LobbyInfoVM? lobbyInfo,
    GameState? gameState,
  }) {
    return LobbyState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lobbyInfo: lobbyInfo ?? this.lobbyInfo,
      gameState: gameState ?? this.gameState,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        lobbyInfo,
        gameState,
      ];
}
