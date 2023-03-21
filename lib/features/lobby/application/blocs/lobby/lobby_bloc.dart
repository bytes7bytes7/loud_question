import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../repositories/interfaces/account_repository.dart';
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
    required AccountRepository accountRepository,
  })  : _lobbyService = lobbyService,
        _userService = userService,
        _gameService = gameService,
        _accountRepository = accountRepository,
        super(const LobbyState()) {
    on<LoadLobbyEvent>(_load, transformer: droppable());
    on<IAmReadyLobbyEvent>(_setReady, transformer: droppable());
    on<StartGameLobbyEvent>(_startGame, transformer: droppable());
    on<StartAnswerLobbyEvent>(_startAnswer, transformer: droppable());
    on<AnswerLobbyEvent>(_answer, transformer: droppable());
    on<CheckAnswerLobbyEvent>(_checkAnswer, transformer: droppable());
    on<RestartLobbyEvent>(_restart, transformer: droppable());
  }

  late LobbyID _lobbyID;
  final LobbyService _lobbyService;
  final GameService _gameService;
  final UserService _userService;
  final AccountRepository _accountRepository;

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
      lobby = await _lobbyService.get(lobbyID: _lobbyID, cached: event.cached);
    } catch (e) {
      emit(
        state.withError('Ошибка загрузки лобби'),
      );

      return;
    }

    late GameState gameState;
    try {
      gameState = await _gameService.get(id: lobby.id, cached: event.cached);
    } catch (e) {
      emit(
        state.withError('не удалось загрузить информацию о состоянии игры'),
      );

      return;
    }

    late User creator;
    try {
      creator =
          await _userService.get(id: lobby.creatorID, cached: event.cached);
    } catch (e) {
      emit(
        state.withError('не удалось загрузить информацию о создателе лобби'),
      );

      return;
    }

    final myID = await _accountRepository.getMyID();

    if (myID == null) {
      emit(state.withError('Ошибка при загрузке вашего ID'));

      return;
    }

    final creatorVM = UserVM(
      id: creator.id.str,
      name: creator.name,
      isCreator: true,
      isLeader: creator.id == gameState.leaderID,
      isMe: creator.id == myID,
      state: _getUserState(creator.id, gameState),
    );

    final guests = <User>[];
    for (final guestID in lobby.guestIDs) {
      try {
        final user = await _userService.get(id: guestID, cached: event.cached);
        guests.add(user);
      } catch (e) {
        emit(
          state.withError('не удалось загрузить информацию об участнике лобби'),
        );

        return;
      }
    }

    final guestsVM = <UserVM>[];
    for (final guest in guests) {
      final guestVM = UserVM(
        id: guest.id.str,
        name: guest.name,
        isCreator: false,
        isLeader: guest.id == gameState.leaderID,
        isMe: guest.id == myID,
        state: _getUserState(guest.id, gameState),
      );

      guestsVM.add(guestVM);
    }

    final lobbyInfo = LobbyInfoVM(
      id: lobby.id.str,
      me: creator.id == myID
          ? creatorVM
          : guestsVM.firstWhere((e) => e.id == myID.str),
      creator: creatorVM,
      createdAtInMSSinceEpoch: lobby.createdAtInMSSinceEpoch,
      guests: guestsVM,
    );

    emit(
      state.copyWith(
        lobbyInfo: lobbyInfo,
        gameState: gameState,
        isLoading: false,
      ),
    );
  }

  Future<void> _setReady(
    IAmReadyLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  Future<void> _startGame(
    StartGameLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  Future<void> _startAnswer(
    StartAnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  Future<void> _answer(
    AnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  Future<void> _checkAnswer(
    CheckAnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  Future<void> _restart(
    RestartLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {}

  UserState _getUserState(UserID userID, GameState gameState) {
    if (gameState is InitGameState) {
      if (gameState.readyIDs.contains(userID)) {
        return UserState.ready;
      }

      return UserState.notReady;
    }

    if (gameState is PlayingGameState) {
      return UserState.playing;
    }

    if (gameState is WaitingForAnswerGameState) {
      if (gameState.hasAnswered.contains(userID)) {
        return UserState.answered;
      }

      return UserState.answering;
    }

    if (gameState is CheckingAnswerGameState) {
      final userAnswer =
          gameState.answers.firstWhereOrNull((e) => e.userID == userID);

      if (userAnswer == null) {
        throw Exception('User answer not found');
      }

      if (userAnswer.answer == gameState.rightAnswer) {
        return UserState.rightAnswer;
      }

      return UserState.wrongAnswer;
    }

    throw Exception('Can not determine UserState');
  }
}
