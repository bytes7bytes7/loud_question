import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/lobby/lobby_bloc.dart';
import '../../application/view_models/lobby_info_vm/lobby_info_vm.dart';
import '../../domain/value_objects/game_state/game_state.dart';

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
        ..add(const LoadLobbyEvent()),
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

        if (state.gameState is InitGameState) {
          return const SizedBox.shrink();
        }

        if (state.gameState is PlayingGameState) {
          return const SizedBox.shrink();
        }

        if (state.gameState is WaitingForAnswerGameState) {
          return const SizedBox.shrink();
        }

        if (gameState is CheckingAnswerGameState) {
          return const SizedBox.shrink();
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
      onRefresh: () async => lobbyBloc.add(const LoadLobbyEvent()),
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
