import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/common.dart';
import '../../../common/presentation/widgets/widgets.dart';
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
        ..setID(lobbyID)
        ..add(const LoadLobbyEvent(cached: true)),
      child: Scaffold(
        appBar: _AppBar(
          lobbyID: lobbyID,
        ),
        body: const _Body(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.lobbyID,
  });

  final String lobbyID;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Лобби $lobbyID'),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final lobbyBloc = context.read<LobbyBloc>();

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
            lobbyBloc: lobbyBloc,
            lobbyInfo: lobbyInfo,
          );
        }

        if (gameState is InitGameState) {
          return _InitStateWidget(
            lobbyBloc: lobbyBloc,
            lobbyInfo: lobbyInfo,
            gameState: gameState,
          );
        }

        if (gameState is PlayingGameState) {
          return _PlayingStateWidget(
            lobbyBloc: lobbyBloc,
            gameState: gameState,
          );
        }

        if (gameState is WaitingForAnswerGameState) {
          return _AnsweringStateWidget(
            lobbyBloc: lobbyBloc,
            lobbyInfo: lobbyInfo,
            gameState: gameState,
          );
        }

        if (gameState is CheckingAnswerGameState) {
          return _CheckingStateWidget(
            lobbyBloc: lobbyBloc,
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
    required this.lobbyBloc,
    required this.lobbyInfo,
  });

  final LobbyBloc lobbyBloc;
  final LobbyInfoVM? lobbyInfo;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => lobbyBloc.add(const LoadLobbyEvent(cached: false)),
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
    required this.lobbyBloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc lobbyBloc;
  final LobbyInfoVM lobbyInfo;
  final InitGameState gameState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async =>
              lobbyBloc.add(const LoadLobbyEvent(cached: false)),
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
                onPressed: () {},
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
              child: ElevatedButton(
                child: const Text('Начать игру!'),
                onPressed: () {},
              ),
            ),
          ),
      ],
    );
  }
}

class _PlayingStateWidget extends StatelessWidget {
  const _PlayingStateWidget({
    required this.lobbyBloc,
    required this.gameState,
  });

  final LobbyBloc lobbyBloc;
  final PlayingGameState gameState;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: () async => lobbyBloc.add(const LoadLobbyEvent(cached: false)),
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
                    '37',
                    style: theme.textTheme.displayLarge,
                  ),
                  if (gameState.question != null) ...[
                    Text(
                      'Вопрос',
                      style: theme.textTheme.titleLarge,
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
          // for refresh indicator
          ListView(
            children: [
              SizedBox(
                height: size.height,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnsweringStateWidget extends StatelessWidget {
  const _AnsweringStateWidget({
    required this.lobbyBloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc lobbyBloc;
  final LobbyInfoVM lobbyInfo;
  final WaitingForAnswerGameState gameState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async =>
              lobbyBloc.add(const LoadLobbyEvent(cached: false)),
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
                  text: 'Ответило: ${gameState.hasAnswered.length}/'
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ваш ответ...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _CheckingStateWidget extends StatelessWidget {
  const _CheckingStateWidget({
    required this.lobbyBloc,
    required this.lobbyInfo,
    required this.gameState,
  });

  final LobbyBloc lobbyBloc;
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
          onRefresh: () async =>
              lobbyBloc.add(const LoadLobbyEvent(cached: false)),
          child: ListView.separated(
            // info bar, right answer, empty box, creator card
            itemCount: lobbyInfo.guests.length + 4,
            separatorBuilder: (context, index) {
              if (index == 2) {
                // creator bar
                return const TitleBar(
                  text: 'Я',
                );
              }

              if (index == 3) {
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
                // empty box
                return const SizedBox.shrink();
              }

              if (index == 3) {
                // me
                return UserCard(
                  user: lobbyInfo.me,
                );
              }

              if (lobbyInfo.creator.id != lobbyInfo.me.id) {
                if (index == 4) {
                  return UserCard(
                    user: lobbyInfo.creator,
                  );
                }

                return UserCard(
                  user: lobbyInfo.guests[index - 5],
                );
              }

              return UserCard(
                user: lobbyInfo.guests[index - 4],
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
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
