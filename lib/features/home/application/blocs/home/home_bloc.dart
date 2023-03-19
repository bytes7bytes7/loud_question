import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/common.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(const HomeState()) {
    on<LogOutHomeEvent>(_logOut, transformer: droppable());
  }

  final AuthService _authService;

  Future<void> _logOut(LogOutHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await _authService.logOut();
    } catch (e) {
      //
    }
  }
}
