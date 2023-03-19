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
      create: (context) =>
          _getIt.get<HomeBloc>()..add(const LoadLobbiesHomeEvent()),
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
        floatingActionButton: _FAB(),
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

    return AppBar(
      title: const Text('Список лобби'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => bloc.add(const LogOutHomeEvent()),
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

        if (state.error.isNotEmpty) {
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
                          'Ошибка',
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

class _FAB extends StatelessWidget {
  const _FAB();

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
      onPressed: openAlert,
      child: const Icon(Icons.add),
    );
  }
}
