import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../application/blocs/home/home_bloc.dart';

final _getIt = GetIt.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getIt.get<HomeBloc>(),
      child: Scaffold(
        appBar: _AppBar(),
        body: Center(),
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
      title: const Text('Главная'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => bloc.add(const LogOutHomeEvent()),
        ),
      ],
    );
  }
}
