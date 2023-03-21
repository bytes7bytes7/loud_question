import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

import '../../../common/common.dart';
import '../../application/blocs/lobby/lobby_bloc.dart';
import '../../application/view_models/lobby_info_vm/lobby_info_vm.dart';
import '../../domain/value_objects/game_state/game_state.dart';
import '../widgets/widgets.dart';

final _getIt = GetIt.instance;

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({
    super.key,
    required this.lobbyID,
  });

  final String lobbyID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<LobbyBloc>()
        ..startPolling(lobbyID)
        ..add(const LoadLobbyEvent(cached: true)),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LobbyBloc>();

          return WillPopScope(
            onWillPop: () async {
              bloc.dispose();
              return true;
            },
            child: Scaffold(
              appBar: _AppBar(
                lobbyID: lobbyID,
                bloc: bloc,
              ),
              body: const _Body(),
            ),
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.lobbyID,
    required this.bloc,
  });

  final String lobbyID;
  final LobbyBloc bloc;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Лобби $lobbyID'),
      actions: [
        IconButton(
          icon: const Icon(Icons.restart_alt),
          onPressed: () => bloc.add(const RestartLobbyEvent()),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LobbyBloc>();

    return BlocConsumer<LobbyBloc, LobbyState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          createSnackBar(
            context,
            message: state.error,
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final lobbyInfo = state.lobbyInfo;
        final gameState = state.gameState;

        if (lobbyInfo == null || gameState == null) {
          return _ErrorWidget(
            bloc: bloc,
            lobbyInfo: lobbyInfo,
          );
        }

        if (gameState is InitGameState) {
          return _InitStateWidget(
            bloc: bloc,
            lobbyInfo: lobbyInfo,
            gameState: gameState,
          );
        }

        if (gameState is PlayingGameState) {
          return _PlayingStateWidget(
            bloc: bloc,
            gameState: gameState,
            secondsLeft: state.secondsLeft,
          );
        }

        if (gameState is WaitingForAnswerGameState) {
          return _AnsweringStateWidget(
            bloc: bloc,
            lobbyInfo: lobbyInfo,
            gameState: gameState,
          );
        }

        if (gameState is CheckingAnswerGameState) {
          return _CheckingStateWidget(
            bloc: bloc,
            lobbyInfo: lobbyInfo,
            gameState: gameState,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.bloc,
    required this.lobbyInfo,
  });

  final LobbyBloc bloc;
  final LobbyInfoVM? lobbyInfo;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => bloc.add(const LoadLobbyEvent(cached: false)),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    lobbyInfo == null
                        ? 'Не удалось загрузить информацию о лобби'
                        : 'Не удалось загрузить информации о статусе игры',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InitStateWidget extends StatelessWidget {
  const _InitStateWidget({
    required this.bloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc bloc;
  final LobbyInfoVM lobbyInfo;
  final InitGameState gameState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => bloc.add(const LoadLobbyEvent(cached: false)),
          child: ListView.separated(
            // info bar, empty box, creator card
            itemCount: lobbyInfo.guests.length + 3,
            separatorBuilder: (context, index) {
              if (index == 1) {
                // creator bar
                return const TitleBar(
                  text: 'Я',
                );
              }

              if (index == 2) {
                // other players bar
                return TitleBar(
                  text: 'Другие игроки (${lobbyInfo.guests.length})',
                );
              }

              return const Divider();
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                // info bar
                return InfoBar(
                  text: 'Готово: ${gameState.readyIDs.length}/'
                      '${lobbyInfo.guests.length + 1}',
                );
              }

              if (index == 1) {
                // empty box
                return const SizedBox.shrink();
              }

              if (index == 2) {
                // me
                return UserCard(
                  user: lobbyInfo.me,
                );
              }

              if (lobbyInfo.creator.id != lobbyInfo.me.id) {
                if (index == 3) {
                  return UserCard(
                    user: lobbyInfo.creator,
                  );
                }

                return UserCard(
                  user: lobbyInfo.guests[index - 4],
                );
              }

              return UserCard(
                user: lobbyInfo.guests[index - 3],
              );
            },
          ),
        ),
        if (!gameState.readyIDs.contains(UserID.fromString(lobbyInfo.me.id)))
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ElevatedButton(
                child: const Text('Я готов'),
                onPressed: () => bloc.add(const SetReadyLobbyEvent()),
              ),
            ),
          ),
        if (!(gameState.readyIDs.length == lobbyInfo.guests.length + 1) &&
            gameState.readyIDs.contains(UserID.fromString(lobbyInfo.me.id)))
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ElevatedButton(
                child: const Text('Я не готов'),
                onPressed: () => bloc.add(const SetNotReadyLobbyEvent()),
              ),
            ),
          ),
        if (gameState.readyIDs.length == lobbyInfo.guests.length + 1)
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Я не готов'),
                      onPressed: () => bloc.add(const SetNotReadyLobbyEvent()),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Начать игру!'),
                      onPressed: () => bloc.add(const StartGameLobbyEvent()),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _PlayingStateWidget extends StatelessWidget {
  const _PlayingStateWidget({
    required this.bloc,
    required this.gameState,
    required this.secondsLeft,
  });

  final LobbyBloc bloc;
  final PlayingGameState gameState;
  final int? secondsLeft;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final timeEnds = secondsLeft == 0;

    return RefreshIndicator(
      onRefresh: () async => bloc.add(const LoadLobbyEvent(cached: false)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Осталось',
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    secondsLeft == null ? '-' : secondsLeft.toString(),
                    style: theme.textTheme.displayLarge,
                  ),
                  if (gameState.question != null) ...[
                    Text(
                      'Вопрос',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      gameState.question!,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ],
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: size.height,
              ),
            ],
          ),
          if (timeEnds)
            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ElevatedButton(
                  child: const Text('Перейти к ответам'),
                  onPressed: () => bloc.add(const StartAnswerLobbyEvent()),
                ),
              ),
            ),
          // for refresh indicator
        ],
      ),
    );
  }
}

class _AnsweringStateWidget extends HookWidget {
  const _AnsweringStateWidget({
    required this.bloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc bloc;
  final LobbyInfoVM lobbyInfo;
  final WaitingForAnswerGameState gameState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final question = gameState.question;
    final hasQuestion = question != null;
    final questionOneOrZero = hasQuestion ? 1 : 0;

    final controller = useTextEditingController();

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => bloc.add(const LoadLobbyEvent(cached: false)),
          child: ListView.separated(
            // info bar, empty box, creator card
            // question if not null
            itemCount: lobbyInfo.guests.length + 3 + questionOneOrZero,
            separatorBuilder: (context, index) {
              if (index == 1 + questionOneOrZero) {
                // creator bar
                return const TitleBar(
                  text: 'Я',
                );
              }

              if (index == 2 + questionOneOrZero) {
                // other players bar
                return TitleBar(
                  text: 'Другие игроки (${lobbyInfo.guests.length})',
                );
              }

              return const Divider();
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                // info bar
                return InfoBar(
                  text: 'Ответило: ${gameState.hasAnswered.length}/'
                      '${lobbyInfo.guests.length + 1}',
                );
              }

              if (index == 1 && hasQuestion) {
                // question
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Вопрос',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        question,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              }

              if (index == 1 + questionOneOrZero) {
                // empty box
                return const SizedBox.shrink();
              }

              if (index == 2 + questionOneOrZero) {
                // me
                return UserCard(
                  user: lobbyInfo.me,
                );
              }

              if (lobbyInfo.creator.id != lobbyInfo.me.id) {
                if (index == 3 + questionOneOrZero) {
                  return UserCard(
                    user: lobbyInfo.creator,
                  );
                }

                return UserCard(
                  user: lobbyInfo.guests[index - 4 - questionOneOrZero],
                );
              }

              return UserCard(
                user: lobbyInfo.guests[index - 3 - questionOneOrZero],
              );
            },
          ),
        ),
        if (!gameState.hasAnswered.contains(UserID.fromString(lobbyInfo.me.id)))
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Ваш ответ...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => bloc.add(
                        AnswerLobbyEvent(answer: controller.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (gameState.hasAnswered.length == lobbyInfo.guests.length + 1)
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ElevatedButton(
                child: const Text('Узнать ответ'),
                onPressed: () => bloc.add(const CheckAnswerLobbyEvent()),
              ),
            ),
          ),
      ],
    );
  }
}

class _CheckingStateWidget extends StatelessWidget {
  const _CheckingStateWidget({
    required this.bloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc bloc;
  final LobbyInfoVM lobbyInfo;
  final CheckingAnswerGameState gameState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rightAnswersAmount = gameState.answers
        .where(
          (e) => e.answer.toLowerCase() == gameState.rightAnswer.toLowerCase(),
        )
        .length;

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => bloc.add(const LoadLobbyEvent(cached: false)),
          child: ListView.separated(
            // info bar, right answer, question, empty box, creator card
            itemCount: lobbyInfo.guests.length + 5,
            separatorBuilder: (context, index) {
              if (index == 3) {
                // creator bar
                return const TitleBar(
                  text: 'Я',
                );
              }

              if (index == 4) {
                // other players bar
                return TitleBar(
                  text: 'Другие игроки (${lobbyInfo.guests.length})',
                );
              }

              return const Divider();
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                // info bar
                return InfoBar(
                  text: 'Верных ответов: $rightAnswersAmount/'
                      '${lobbyInfo.guests.length + 1}',
                );
              }

              if (index == 1) {
                // right answer
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Правильный ответ',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        gameState.rightAnswer,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              }

              if (index == 2) {
                // question
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Вопрос',
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        gameState.question,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              }

              if (index == 3) {
                // empty box
                return const SizedBox.shrink();
              }

              if (index == 4) {
                // me
                return UserCard(
                  user: lobbyInfo.me,
                );
              }

              if (lobbyInfo.creator.id != lobbyInfo.me.id) {
                if (index == 5) {
                  return UserCard(
                    user: lobbyInfo.creator,
                  );
                }

                return UserCard(
                  user: lobbyInfo.guests[index - 6],
                );
              }

              return UserCard(
                user: lobbyInfo.guests[index - 5],
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ElevatedButton(
              child: const Text('Заново'),
              onPressed: () => bloc.add(const RestartLobbyEvent()),
            ),
          ),
        ),
      ],
    );
  }
}
