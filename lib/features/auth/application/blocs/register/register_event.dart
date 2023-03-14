part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class DoRegisterEvent extends RegisterEvent {
  const DoRegisterEvent({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  @override
  List<Object?> get props => [name, password];
}
