import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final _getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _getIt.get<GoRouter>(),
      title: 'Load Question',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
