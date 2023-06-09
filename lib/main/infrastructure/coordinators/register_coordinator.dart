import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../features/auth/auth.dart';
import '../../../features/common/domain/services/auth_service.dart';
import '../router/router.dart';
import 'coordinator.dart';

@Singleton(as: RegisterCoordinator)
class ProdRegisterCoordinator extends Coordinator
    implements RegisterCoordinator {
  ProdRegisterCoordinator({
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

      final isRegistering =
          location == const RegisterRoute().namedLocation(goRouter) ||
              location == '/';

      final isLoggingIn =
          location == const LogInRoute().namedLocation(goRouter);

      if (!isLoggedIn && !isRegistering && !isLoggingIn) {
        return const RegisterRoute().go(goRouter);
      }

      if (isLoggedIn && isRegistering) {
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
  void onGoToLogInButtonPressed() {
    const LogInRoute().go(goRouter);
  }
}
