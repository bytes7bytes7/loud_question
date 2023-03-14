part of 'register_bloc.dart';

class RegisterState extends Equatable with Loadable, Errorable {
  const RegisterState({
    this.isLoading = false,
    this.error = '',
  });

  @override
  final bool isLoading;

  @override
  final String error;

  RegisterState withLoading() => copyWith(isLoading: true);

  RegisterState withError(String error) => copyWith(error: error);

  RegisterState withoutError() => copyWith();

  RegisterState copyWith({
    bool? isLoading,
    String? error = '',
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
      ];
}
