import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../repositories/interfaces/account_repository.dart';
import '../../../../../utils/wrapper.dart';
import '../../../../common/application/application.dart';
import '../../../../common/domain/domain.dart';
import '../../../domain/domain.dart';
import '../../providers/date_time_provider.dart';
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
    required DateTimeProvider dateTimeProvider,
    required ListenGameStateProvider listenGameStateProvider,
    required ListenLobbyProvider listenLobbyProvider,
  })  : _lobbyService = lobbyService,
        _userService = userService,
        _gameService = gameService,
        _accountRepository = accountRepository,
        _dateTimeProvider = dateTimeProvider,
        _listenGameStateProvider = listenGameStateProvider,
        _listenLobbyProvider = listenLobbyProvider,
        super(const LobbyState()) {
    on<LoadLobbyEvent>(_load, transformer: droppable());
    on<SetLeaderLobbyEvent>(_setLeader, transformer: restartable());
    on<SetReadyLobbyEvent>(_setReady, transformer: droppable());
    on<SetNotReadyLobbyEvent>(_setNotReady, transformer: droppable());
    on<StartGameLobbyEvent>(_startGame, transformer: droppable());
    on<StartAnswerLobbyEvent>(_startAnswer, transformer: droppable());
    on<AnswerLobbyEvent>(_answer, transformer: droppable());
    on<CheckAnswerLobbyEvent>(_checkAnswer, transformer: droppable());
    on<RestartLobbyEvent>(_restart, transformer: droppable());
    on<_ProcessGameStateLobbyEvent>(
      _processGameState,
      transformer: restartable(),
    );
    on<_ProcessLobbyLobbyEvent>(
      _processLobby,
      transformer: restartable(),
    );
    on<_UpdateTimeLobbyEvent>(
      _updateTime,
      transformer: restartable(),
    );
  }

  late LobbyID _lobbyID;
  final LobbyService _lobbyService;
  final GameService _gameService;
  final UserService _userService;
  final AccountRepository _accountRepository;
  final DateTimeProvider _dateTimeProvider;
  final ListenGameStateProvider _listenGameStateProvider;
  final ListenLobbyProvider _listenLobbyProvider;
  StreamSubscription<GameState>? _stateSub;
  StreamSubscription<Lobby>? _lobbySub;
  Timer? _timer;

  void dispose() {
    _timer?.cancel();

    _stateSub?.cancel();
    _listenGameStateProvider.stop();

    _lobbySub?.cancel();
    _listenLobbyProvider.stop();
  }

  void startPolling(String lobbyID) {
    _lobbyID = LobbyID.fromString(lobbyID);

    // game state long polling
    _listenGameStateProvider.setLobbyID(_lobbyID);
    _stateSub = _listenGameStateProvider.stream.listen(
      (state) => add(_ProcessGameStateLobbyEvent(gameState: state)),
    );
    _listenGameStateProvider.start();

    // lobby long polling
    _listenLobbyProvider.setLobbyID(_lobbyID);
    _lobbySub = _listenLobbyProvider.stream.listen(
      (lobby) => add(_ProcessLobbyLobbyEvent(lobby: lobby)),
    );
    _listenLobbyProvider.start();
  }

  Future<void> _load(
    LoadLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    late Lobby lobby;
    try {
      lobby = await _lobbyService.get(lobbyID: _lobbyID, cached: false);
    } catch (e) {
      emit(
        state.withError('Ошибка загрузки лобби'),
      );

      return;
    }

    late GameState gameState;
    try {
      gameState = await _gameService.get(id: lobby.id, cached: false);
    } catch (e) {
      emit(
        state.withError('не удалось загрузить информацию о состоянии игры'),
      );

      return;
    }

    late User creator;
    try {
      creator = await _userService.get(id: lobby.creatorID, cached: false);
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
        final user = await _userService.get(id: guestID, cached: false);
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

    _timer?.cancel();

    int? secondsLeft;
    if (gameState is PlayingGameState) {
      final startedAt =
          DateTime.fromMillisecondsSinceEpoch(gameState.startedAtMSSinceEpoch);
      final endsAt =
          startedAt.add(Duration(seconds: gameState.endsAfterSeconds));
      final now = _dateTimeProvider.now();
      final secLeft = endsAt.difference(now).inSeconds;

      if (secLeft <= 0) {
        secondsLeft = 0;
      }

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = _dateTimeProvider.now();

        final secondsLeft = endsAt.difference(now).inSeconds;

        if (secondsLeft < 0) {
          timer.cancel();
        } else {
          add(_UpdateTimeLobbyEvent(secondsLeft: secondsLeft));
        }
      });
    }

    emit(
      state.copyWith(
        lobbyInfo: lobbyInfo,
        gameState: gameState,
        isLoading: false,
        secondsLeft: Wrapper(secondsLeft),
      ),
    );
  }

  Future<void> _setLeader(
    SetLeaderLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.setLeader(
        id: _lobbyID,
        userID: UserID.fromString(event.userID),
      );
    } catch (e) {
      emit(
        state.withError('Ошибка смены ведущего'),
      );

      return;
    }
  }

  Future<void> _setReady(
    SetReadyLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.setReady(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка готовности'),
      );

      return;
    }
  }

  Future<void> _setNotReady(
    SetNotReadyLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.setNotReady(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка отмены готовности'),
      );

      return;
    }
  }

  Future<void> _startGame(
    StartGameLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.startGame(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка начала игры'),
      );

      return;
    }
  }

  Future<void> _startAnswer(
    StartAnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.startAnswer(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка перехода к ответам'),
      );

      return;
    }
  }

  Future<void> _answer(
    AnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.giveAnswer(id: _lobbyID, answer: event.answer);
    } catch (e) {
      emit(
        state.withError('Ошибка передачи ответа'),
      );

      return;
    }
  }

  Future<void> _checkAnswer(
    CheckAnswerLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.getAnswer(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка получения правильного ответа'),
      );

      return;
    }
  }

  Future<void> _restart(
    RestartLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(state.withLoading());

    try {
      await _gameService.restart(id: _lobbyID);
    } catch (e) {
      emit(
        state.withError('Ошибка перезапуска игры'),
      );

      return;
    }
  }

  Future<void> _processGameState(
    _ProcessGameStateLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    final gameState = event.gameState;

    final oldLobbyInfo = state.lobbyInfo;

    LobbyInfoVM? newLobbyInfo;
    if (oldLobbyInfo != null) {
      final oldCreatorVM = oldLobbyInfo.creator;

      final myID = UserID.fromString(oldLobbyInfo.me.id);

      final creatorVM = UserVM(
        id: oldCreatorVM.id,
        name: oldCreatorVM.name,
        isCreator: true,
        isLeader: oldCreatorVM.id == gameState.leaderID.str,
        isMe: oldCreatorVM.id == myID.str,
        state: _getUserState(UserID.fromString(oldCreatorVM.id), gameState),
      );

      final oldMeVM = oldLobbyInfo.me;

      final meVM = UserVM(
        id: oldMeVM.id,
        name: oldMeVM.name,
        isMe: true,
        isCreator: oldMeVM.id == oldLobbyInfo.creator.id,
        isLeader: oldMeVM.id == gameState.leaderID.str,
        state: _getUserState(UserID.fromString(oldMeVM.id), gameState),
      );

      final guestsVM = <UserVM>[];
      for (final oldGuestVM in oldLobbyInfo.guests) {
        final guestVM = UserVM(
          id: oldGuestVM.id,
          name: oldGuestVM.name,
          isMe: oldGuestVM.id == myID.str,
          isCreator: oldGuestVM.id == oldLobbyInfo.creator.id,
          isLeader: oldGuestVM.id == gameState.leaderID.str,
          state: _getUserState(UserID.fromString(oldGuestVM.id), gameState),
        );

        guestsVM.add(guestVM);
      }

      newLobbyInfo = LobbyInfoVM(
        id: oldLobbyInfo.id,
        me: meVM,
        creator: creatorVM,
        createdAtInMSSinceEpoch: oldLobbyInfo.createdAtInMSSinceEpoch,
        guests: guestsVM,
      );
    }

    _timer?.cancel();

    if (gameState is PlayingGameState) {
      final startedAt =
          DateTime.fromMillisecondsSinceEpoch(gameState.startedAtMSSinceEpoch);
      final endsAt =
          startedAt.add(Duration(seconds: gameState.endsAfterSeconds));

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = _dateTimeProvider.now();
        final secondsLeft = endsAt.difference(now).inSeconds;

        if (secondsLeft < 0) {
          timer.cancel();
        } else {
          add(_UpdateTimeLobbyEvent(secondsLeft: secondsLeft));
        }
      });
    }

    await _gameService.update(gameState: gameState);

    emit(
      state.copyWith(
        isLoading: false,
        gameState: event.gameState,
        secondsLeft: gameState is InitGameState ? const Wrapper(null) : null,
        lobbyInfo: newLobbyInfo,
      ),
    );
  }

  Future<void> _processLobby(
    _ProcessLobbyLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    final lobby = event.lobby;
    final oldLobbyVM = state.lobbyInfo;
    final gameState = state.gameState;

    if (oldLobbyVM == null || gameState == null) {
      return;
    }

    final addedIDs = <UserID>[];
    final deletedIDs = <UserID>[];
    final stayedIDs = <UserID>[];

    for (final oldGuest in oldLobbyVM.guests) {
      final currentID = UserID.fromString(oldGuest.id);

      if (lobby.guestIDs.contains(currentID)) {
        stayedIDs.add(currentID);
      } else {
        deletedIDs.add(currentID);
      }
    }

    for (final newID in lobby.guestIDs) {
      if (oldLobbyVM.guests.firstWhereOrNull((e) => e.id == newID.str) ==
          null) {
        addedIDs.add(newID);
      }
    }

    final myID = oldLobbyVM.me.id;

    final guestVMs = List.of(oldLobbyVM.guests);

    for (final id in deletedIDs) {
      guestVMs.removeWhere((e) => e.id == id.str);
    }

    for (final id in addedIDs) {
      late User guest;
      try {
        guest = await _userService.get(id: id);
      } catch (e) {
        emit(
          state.withError('не удалось загрузить информацию об участнике лобби'),
        );

        return;
      }

      final guestVM = UserVM(
        id: id.str,
        name: guest.name,
        isMe: id.str == myID,
        isCreator: id == lobby.creatorID,
        isLeader: id == gameState.leaderID,
        state: _getUserState(id, gameState),
      );

      guestVMs.add(guestVM);
    }

    await _lobbyService.update(lobby: lobby);

    emit(
      state.copyWith(
        isLoading: false,
        lobbyInfo: oldLobbyVM.copyWith(
          guests: guestVMs,
        ),
      ),
    );
  }

  Future<void> _updateTime(
    _UpdateTimeLobbyEvent event,
    Emitter<LobbyState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: false,
        secondsLeft: Wrapper(event.secondsLeft),
      ),
    );
  }

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
