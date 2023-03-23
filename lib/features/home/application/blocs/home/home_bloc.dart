import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../common/application/application.dart';
import '../../../../common/domain/domain.dart';
import '../../../domain/services/home_service.dart';
import '../../coordinators/home_coordinator.dart';
import '../../providers/song_provider.dart';
import '../../view_models/lobby_vm/lobby_vm.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AuthService authService,
    required HomeService homeService,
    required UserService userService,
    required HomeCoordinator coordinator,
    required SongProvider songProvider,
    required AudioPlayer player,
  })  : _authService = authService,
        _homeService = homeService,
        _userService = userService,
        _coordinator = coordinator,
        _songProvider = songProvider,
        _player = player,
        super(const HomeState()) {
    on<LogOutHomeEvent>(_logOut, transformer: droppable());
    on<LoadLobbiesHomeEvent>(_loadLobbies, transformer: droppable());
    on<OpenLobbyHomeEvent>(_openLobby, transformer: droppable());
    on<CreateLobbyHomeEvent>(_createLobby, transformer: droppable());
    on<JoinLobbyHomeEvent>(_joinLobby, transformer: droppable());
  }

  final AuthService _authService;
  final HomeService _homeService;
  final UserService _userService;
  final HomeCoordinator _coordinator;
  final SongProvider _songProvider;
  final AudioPlayer _player;

  Future<void> init() async {
    await _player.setUrl(_songProvider.url);
    await _player.load();
  }

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
    emit(state.withLoading());

    late List<Lobby> lobbies;
    try {
      lobbies = await _homeService.load();
    } catch (e) {
      emit(
        state.withError(
          'Ошибка загрузки лобби',
        ),
      );

      return;
    }

    final lobbiesVM = <LobbyVM>[];
    for (final lobby in lobbies) {
      late User creator;
      try {
        creator = await _userService.get(id: lobby.creatorID);
      } catch (e) {
        emit(
          state.withError('Ошибка загрузки информации о создателе лобби'),
        );

        return;
      }

      lobbiesVM.add(
        LobbyVM(
          id: lobby.id.str,
          creatorName: creator.name,
          createdAtInMSSinceEpoch: lobby.createdAtInMSSinceEpoch,
          guestIDs: lobby.guestIDs.map((e) => e.str).toList(),
        ),
      );
    }

    emit(
      state.copyWith(
        isLoading: false,
        lobbies: lobbiesVM,
      ),
    );
  }

  Future<void> _createLobby(
    CreateLobbyHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.withLoading());

    try {
      final lobby = await _homeService.createLobby(password: event.password);

      _coordinator.openLobby(lobbyID: lobby.id.str);

      add(const LoadLobbiesHomeEvent());
    } catch (e) {
      emit(
        state.withError(
          'Ошибка при создании лобби',
        ),
      );
    }
  }

  Future<void> _joinLobby(
    JoinLobbyHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.withLoading());

    try {
      final lobby =
          await _homeService.joinLobby(id: event.id, password: event.password);

      _coordinator.openLobby(lobbyID: lobby.id.str);

      add(const LoadLobbiesHomeEvent());
    } on RequestException catch (e) {
      emit(state.withError(e.description));
    } catch (e) {
      emit(
        state.withError(
          'Ошибка присоединения к лобби',
        ),
      );
    }
  }

  void _openLobby(OpenLobbyHomeEvent event, Emitter<HomeState> emit) {
    _coordinator.openLobby(lobbyID: event.lobbyID);
  }
}
