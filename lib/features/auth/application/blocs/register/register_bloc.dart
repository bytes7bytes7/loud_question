import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/common.dart';
import '../../../domain/domain.dart';
import '../../coordinators/register_coordinator.dart';

part 'register_event.dart';

part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required RegisterCoordinator registerCoordinator,
    required AuthService authService,
  })  : _coordinator = registerCoordinator,
        _authService = authService,
        super(const RegisterState()) {
    on<DoRegisterEvent>(_register, transformer: droppable());
    on<OpenLogInRegisterEvent>(_openLogIn, transformer: droppable());
  }

  final RegisterCoordinator _coordinator;
  final AuthService _authService;

  Future<void> _register(
    DoRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.name.isEmpty || event.password.isEmpty) {
      emit(state.withError('Поля должны быть заполнены'));
      emit(state.withoutError());
      return;
    }

    emit(state.withLoading());

    try {
      await _authService.register(name: event.name, password: event.password);
      emit(state.withoutError());
    } on RequestException catch (e) {
      emit(state.withError(e.description));
    } catch (e) {
      emit(state.withError('Ошибка'));
    }
  }

  void _openLogIn(OpenLogInRegisterEvent event, Emitter<RegisterState> emit) {
    _coordinator.onGoToLogInButtonPressed();
  }
}
