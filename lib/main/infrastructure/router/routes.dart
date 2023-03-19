part of 'router.dart';

class NotFoundRoute extends CosyRoute {
  const NotFoundRoute();

  @override
  GoRoute get route => _AppRoutes.notFound;
}

class RegisterRoute extends CosyRoute {
  const RegisterRoute();

  @override
  GoRoute get route => _AppRoutes.register;
}

class LogInRoute extends CosyRoute {
  const LogInRoute();

  @override
  GoRoute get route => _AppRoutes.logIn;
}

class HomeRoute extends CosyRoute {
  const HomeRoute();

  @override
  GoRoute get route => _AppRoutes.home;
}

class LobbyRoute extends CosyRoute {
  const LobbyRoute({
    required this.lobbyID,
  });

  final String lobbyID;

  @override
  Map<String, String> get params => {
        'lobbyID': lobbyID,
      };

  @override
  GoRoute get route => _AppRoutes.lobby;
}
