part of 'home_bloc.dart';

class HomeState extends Equatable with Loadable, Errorable {
  const HomeState({
    this.isLoading = false,
    this.error = '',
    this.lobbies = const [],
  });

  @override
  final bool isLoading;

  @override
  final String error;

  final List<LobbyVM> lobbies;

  HomeState withLoading() => copyWith(isLoading: true);

  HomeState withError(String error) => copyWith(error: error, isLoading: false);

  HomeState withoutError() => copyWith(isLoading: false);

  HomeState copyWith({
    bool? isLoading,
    String? error = '',
    List<LobbyVM>? lobbies,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lobbies: lobbies ?? this.lobbies,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        lobbies,
      ];
}
