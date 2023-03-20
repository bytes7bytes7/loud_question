import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final _getIt = GetIt.instance;
final _theme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
  textTheme: Typography.material2021().black,
  useMaterial3: true,
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _getIt.get<GoRouter>(),
      title: 'Load Question',
      theme: _theme.copyWith(
        appBarTheme: _theme.appBarTheme.copyWith(
          backgroundColor: _theme.colorScheme.primary,
          foregroundColor: _theme.colorScheme.onPrimary,
        ),
        snackBarTheme: _theme.snackBarTheme.copyWith(
          contentTextStyle: _theme.textTheme.bodyMedium?.copyWith(
            color: _theme.colorScheme.onTertiary,
          ),
          backgroundColor: _theme.colorScheme.tertiary,
        ),
      ),
    );
  }
}
