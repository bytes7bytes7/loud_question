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

class CreateLobbyHomeEvent extends HomeEvent {
  const CreateLobbyHomeEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class JoinLobbyHomeEvent extends HomeEvent {
  const JoinLobbyHomeEvent({
    required this.id,
    required this.password,
  });

  final String id;
  final String password;

  @override
  List<Object?> get props => [id, password];
}
