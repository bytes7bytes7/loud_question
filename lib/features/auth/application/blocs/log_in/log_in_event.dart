part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object?> get props => [];
}

class DoLogInEvent extends LogInEvent {
  const DoLogInEvent({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  @override
  List<Object?> get props => [name, password];
}

class OpenRegisterLogInEvent extends LogInEvent {
  const OpenRegisterLogInEvent();
}
