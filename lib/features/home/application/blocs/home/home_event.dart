part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LogOutHomeEvent extends HomeEvent {
  const LogOutHomeEvent();
}

class LoadLobbiesHomeEvent extends HomeEvent {
  const LoadLobbiesHomeEvent();
}

class OpenLobbyHomeEvent extends HomeEvent {
  const OpenLobbyHomeEvent({
    required this.lobbyID,
  });

  final String lobbyID;

  @override
  List<Object?> get props => [lobbyID];
}
