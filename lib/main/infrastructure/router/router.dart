import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../features/features.dart';
import '../../../utils/typedef.dart';
import '../../presentation/screens/screens.dart';

part 'transition.dart';

part 'routes.dart';

part 'cosy_route.dart';

part 'app_routes.dart';

final _rootKey = NavigatorKey();

@module
abstract class RouterModule {
  @singleton
  NavigatorKey get rootKey => _rootKey;

  @singleton
  GoRouter router(
    NavigatorKey key,
    AuthService authService,
  ) {
    return GoRouter(
      navigatorKey: key,
      initialLocation: const RegisterRoute().route.path,
      errorPageBuilder: const NotFoundRoute().route.pageBuilder,
      redirect: (context, state) {
        GoRouter goRouter;
        try {
          goRouter = GoRouter.of(context);
        } catch (e) {
          return null;
        }

        final location = state.location;

        final isLoggedIn = authService.isLoggedIn;
        final isRegistering =
            location == const RegisterRoute().namedLocation(goRouter) ||
                location == '/';
        final isLoggingIn =
            location == const LogInRoute().namedLocation(goRouter) ||
                location == '/';

        if (isLoggedIn && (isRegistering || isLoggingIn)) {
          return const HomeRoute().route.path;
        }

        if (!isLoggedIn && !isRegistering && !isLoggingIn) {
          return const RegisterRoute().route.path;
        }

        return null;
      },
      routes: [
        const NotFoundRoute().route,
        const LogInRoute().route,
        const RegisterRoute().route,
        const HomeRoute().route,
      ],
    );
  }
}
