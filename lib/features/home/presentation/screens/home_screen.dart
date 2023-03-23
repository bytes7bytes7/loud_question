import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../common/presentation/widgets/widgets.dart';
import '../../application/blocs/home/home_bloc.dart';
import '../widgets/widgets.dart';

final _getIt = GetIt.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<HomeBloc>()
        ..init()
        ..add(const LoadLobbiesHomeEvent()),
      child: Scaffold(
        appBar: const _AppBar(),
        body: const _Body(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            _JoinLobbyFAB(),
            SizedBox(
              width: 20,
            ),
            _CreateLobbyFAB(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    Future<void> openAlert() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Выход'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const [
                  Text(
                    'Вы действительно хотите выйти из учетной записи?',
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Отмена'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Выйти'),
                onPressed: () {
                  bloc.add(const LogOutHomeEvent());
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return AppBar(
      title: const Text('Список лобби'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: openAlert,
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocConsumer<HomeBloc, HomeState>(
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

        if (state.lobbies.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async => bloc.add(const LoadLobbiesHomeEvent()),
            child: Column(
              children: const [
                Expanded(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Создайте свое лобби или присоединитесь к уже существующему',
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

        return RefreshIndicator(
          onRefresh: () async => bloc.add(const LoadLobbiesHomeEvent()),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.lobbies.length,
            separatorBuilder: (context, index) {
              return const Separator();
            },
            itemBuilder: (context, index) {
              final lobby = state.lobbies[index];

              return LobbyCard(
                lobbyID: lobby.id,
                creatorName: lobby.creatorName,
                onPressed: () => bloc.add(
                  OpenLobbyHomeEvent(
                    lobbyID: lobby.id,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _JoinLobbyFAB extends StatelessWidget {
  const _JoinLobbyFAB();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    Future<void> openAlert() async {
      var id = '';
      var password = '';

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Присоединение к лобби'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextField(
                    onChanged: (value) {
                      id = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'ID',
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Пароль',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Отмена'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Присоединиться'),
                onPressed: () {
                  bloc.add(JoinLobbyHomeEvent(id: id, password: password));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      heroTag: 'join lobby fab',
      onPressed: openAlert,
      child: const Icon(Icons.login),
    );
  }
}

class _CreateLobbyFAB extends StatelessWidget {
  const _CreateLobbyFAB();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    Future<void> openAlert() async {
      var password = '';

      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Создание лобби'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Придумайте пароль',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('Отмена'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Создать'),
                onPressed: () {
                  bloc.add(CreateLobbyHomeEvent(password: password));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return FloatingActionButton(
      heroTag: 'create lobby fab',
      onPressed: openAlert,
      child: const Icon(Icons.add),
    );
  }
}
