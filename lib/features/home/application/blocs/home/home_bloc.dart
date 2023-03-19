import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/common.dart';
import '../../../domain/services/home_service.dart';
import '../../coordinators/home_coordinator.dart';
import '../../view_models/lobby_vm/lobby_vm.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AuthService authService,
    required HomeService homeService,
    required HomeCoordinator coordinator,
  })  : _authService = authService,
        _homeService = homeService,
  _coordinator =coordinator,
        super(const HomeState()) {
    on<LogOutHomeEvent>(_logOut, transformer: droppable());
    on<LoadLobbiesHomeEvent>(_loadLobbies, transformer: droppable());
    on<OpenLobbyHomeEvent>(_openLobby, transformer: droppable());
  }

  final AuthService _authService;
  final HomeService _homeService;
  final HomeCoordinator _coordinator;

  Future<void> _logOut(LogOutHomeEvent event, Emitter<HomeState> emit) async {
    try {
      await _authService.logOut();
    } catch (e) {
      emit(state.withError('Не удалось выйти'));
      //
    }
  }

  Future<void> _loadLobbies(
    LoadLobbiesHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final lobbies = await _homeService.load();

      emit(
        state.copyWith(
          isLoading: false,
          lobbies: lobbies
              .map(
                (e) => LobbyVM(
                  id: e.id.str,
                  creatorID: e.creatorID.str,
                  createdAtInMSSinceEpoch: e.createdAtInMSSinceEpoch,
                  guestIDs: e.guestIDs.map((e) => e.str).toList(),
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      emit(
        state.withError(
          'Ошибка загрузки лобби',
        ),
      );
    }
  }

  void _openLobby(OpenLobbyHomeEvent event, Emitter<HomeState> emit) {
    _coordinator.openLobby(lobbyID: event.lobbyID);
  }
}
