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
