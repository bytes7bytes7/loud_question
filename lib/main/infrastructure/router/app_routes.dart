part of 'router.dart';

String _getName(GoRouterState state) => state.name ?? state.subloc;

Map<String, Object?> _getArgs(GoRouterState state) => {
      'params': state.params,
      'queryParams': state.queryParams,
    };

// ignore: avoid_classes_with_only_static_members
class _AppRoutes {
  const _AppRoutes._();

  static final notFound = GoRoute(
    path: '/not_found',
    name: 'notFound',
    parentNavigatorKey: _rootKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: state.pageKey,
        name: _getName(state),
        arguments: _getArgs(state),
        child: const NotFoundScreen(),
      );
    },
  );

  static final register = GoRoute(
    path: '/register',
    name: 'register',
    parentNavigatorKey: _rootKey,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        name: _getName(state),
        arguments: _getArgs(state),
        transitionsBuilder: _rightward,
        child: const RegisterScreen(),
      );
    },
  );

  static final logIn = GoRoute(
    path: '/log_in',
    name: 'log_in',
    parentNavigatorKey: _rootKey,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        name: _getName(state),
        arguments: _getArgs(state),
        transitionsBuilder: _leftward,
        child: const LogInScreen(),
      );
    },
  );
}
