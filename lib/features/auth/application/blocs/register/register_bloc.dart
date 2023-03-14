import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/application/application.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<DoRegisterEvent>(_register, transformer: droppable());
  }

  Future<void> _register(
    DoRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.name.isEmpty || event.password.isEmpty) {
      emit(state.withError('Поля должны быть заполнены'));
      emit(state.withoutError());
      return;
    }
  }
}
