part of 'router.dart';

class NotFoundRoute extends CosyRoute {
  const NotFoundRoute();

  @override
  GoRoute get route => _AppRoutes.notFound;
}
