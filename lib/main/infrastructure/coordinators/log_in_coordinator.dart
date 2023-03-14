import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../features/auth/application/application.dart';
import '../../../features/auth/domain/domain.dart';
import '../router/router.dart';
import 'coordinator.dart';

@Singleton(as: LogInCoordinator)
class ProdLogInCoordinator extends Coordinator implements LogInCoordinator {
  ProdLogInCoordinator({
    required super.goRouter,
    required AuthService authService,
  }) : _authService = authService;

  final AuthService _authService;
  StreamSubscription? _authSub;

  @override
  @postConstruct
  void init() {
    _authSub = _authService.onLoggedInChanged.listen((isLoggedIn) {
      final location = goRouter.location;

      final isLoggingIn =
          location == const LogInRoute().namedLocation(goRouter);

      final isRegistering =
          location == const RegisterRoute().namedLocation(goRouter);

      if (!isLoggedIn && !isLoggingIn && !isRegistering) {
        return const LogInRoute().go(goRouter);
      }

      if (isLoggedIn && isLoggingIn) {
        return const HomeRoute().go(goRouter);
      }
    });
  }

  @override
  @disposeMethod
  void dispose() {
    _authSub?.cancel();
  }

  @override
  void onGoToRegisterButtonPressed() {
    const RegisterRoute().go(goRouter);
  }
}
