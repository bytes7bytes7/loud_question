import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/application/application.dart';
import '../../../../common/domain/exceptions/request_exception.dart';
import '../../../domain/domain.dart';
import '../../coordinators/log_in_coordinator.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

@injectable
class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc({
    required LogInCoordinator logInCoordinator,
    required AuthService authService,
  })  : _coordinator = logInCoordinator,
        _authService = authService,
        super(const LogInState()) {
    on<DoLogInEvent>(_logIn, transformer: droppable());
    on<OpenRegisterLogInEvent>(_openRegister, transformer: droppable());
  }

  final LogInCoordinator _coordinator;
  final AuthService _authService;

  Future<void> _logIn(DoLogInEvent event, Emitter<LogInState> emit) async {
    if (event.name.isEmpty || event.password.isEmpty) {
      emit(state.withError('Поля должны быть заполнены'));
      emit(state.withoutError());
      return;
    }

    emit(state.withLoading());

    try {
      await _authService.logIn(name: event.name, password: event.password);
      emit(state.withoutError());
    } on RequestException catch (e) {
      emit(state.withError(e.description));
    } catch (e) {
      emit(state.withError('Ошибка'));
    }
  }

  void _openRegister(OpenRegisterLogInEvent event, Emitter<LogInState> emit) {
    _coordinator.onGoToRegisterButtonPressed();
  }
}
