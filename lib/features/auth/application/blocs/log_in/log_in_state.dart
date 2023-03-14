part of 'log_in_bloc.dart';

class LogInState extends Equatable with Loadable, Errorable {
  const LogInState({
    this.isLoading = false,
    this.error = '',
  });

  @override
  final bool isLoading;

  @override
  final String error;

  LogInState withLoading() => copyWith(isLoading: true);

  LogInState withError(String error) =>
      copyWith(error: error, isLoading: false);

  LogInState withoutError() => copyWith(isLoading: false);

  LogInState copyWith({
    bool? isLoading,
    String? error = '',
  }) {
    return LogInState(
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
