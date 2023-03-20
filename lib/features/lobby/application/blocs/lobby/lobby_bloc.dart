import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/application/application.dart';
import '../../../../common/domain/domain.dart';
import '../../../domain/services/game_service.dart';
import '../../../domain/services/lobby_service.dart';
import '../../../domain/value_objects/game_state/game_state.dart';
import '../../view_models/view_models.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

@injectable
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc({
    required LobbyService lobbyService,
    required UserService userService,
    required GameService gameService,
  })  : _lobbyService = lobbyService,
        _userService = userService,
        _gameService = gameService,
        super(const LobbyState()) {
    on<LoadLobbyEvent>(_load, transformer: droppable());
  }

  late LobbyID _lobbyID;
  final LobbyService _lobbyService;
  final GameService _gameService;
  final UserService _userService;

  void setID(String lobbyID) {
    _lobbyID = LobbyID.fromString(lobbyID);
  }

  Future<void> _load(
    LoadLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    late Lobby lobby;
    try {
      lobby = await _lobbyService.get(lobbyID: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка загрузки лобби'),
      );

      return;
    }

    late User creator;
    try {
      creator = await _userService.get(id: lobby.creatorID);
    } catch (e) {
      emit(
        state.withError('не удалось загрузить информацию о создателе лобби'),
      );

      return;
    }

    final guests = <User>[];

    for (final guestID in lobby.guestIDs) {
      try {
        final user = await _userService.get(id: guestID);
        guests.add(user);
      } catch (e) {
        emit(
          state.withError('не удалось загрузить информацию об участнике лобби'),
        );

        return;
      }
    }

    late GameState gameState;
    try {
      gameState = await _gameService.get(id: lobby.id);
    } catch (e) {
      emit(
        state.withError('не удалось загрузить информацию о состоянии игры'),
      );

      return;
    }

    final lobbyInfo = LobbyInfoVM(
      id: lobby.id.str,
      creator: creator,
      createdAtInMSSinceEpoch: lobby.createdAtInMSSinceEpoch,
      guests: guests,
    );

    emit(
      state.copyWith(
        lobbyInfo: lobbyInfo,
        gameState: gameState,
        isLoading: false,
      ),
    );
  }
}
