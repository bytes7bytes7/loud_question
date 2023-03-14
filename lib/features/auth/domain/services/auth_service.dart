import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/domain/domain.dart';
import '../../auth.dart';

@singleton
class AuthService {
  AuthService({
    required AuthProvider authProvider,
    required AuthExceptionProvider authExceptionProvider,
  })  : _authProvider = authProvider,
        _authExceptionProvider = authExceptionProvider;

  final AuthProvider _authProvider;
  final AuthExceptionProvider _authExceptionProvider;
  final _userController = BehaviorSubject<User?>();

  Stream<User?> get onUserChanged => _userController.stream;

  Stream<bool> get onLoggedInChanged =>
      _userController.stream.map((e) => e != null);

  @disposeMethod
  void dispose() {
    _userController.close();
  }

  Future<void> register({
    required String name,
    required String password,
  }) async {
    final request = RegisterRequest(name: name, password: password);

    final future = _authProvider.register(request);

    await future.then((response) {
      response.value.fold(
        (l) {
          _userController.add(null);

          if (l.title == _authExceptionProvider.nameIsAlreadyInUse) {
            throw const NameIsAlreadyInUse();
          } else {
            throw Exception();
          }
        },
        (r) {
          // TODO: save data
          _userController.add(r.user);
        },
      );
    });

    await future.onError((error, stackTrace) {
      throw const ServerError();
    });
  }

  Future<void> logIn({
    required String name,
    required String password,
  }) async {
    final request = LogInRequest(name: name, password: password);

    final future = _authProvider.logIn(request);

    await future.then((response) {
      response.value.fold(
        (l) {
          _userController.add(null);

          if (l.title == _authExceptionProvider.invalidCredentials) {
            throw const InvalidCredentials();
          } else {
            throw Exception();
          }
        },
        (r) {
          // TODO: save data
          _userController.add(r.user);
        },
      );
    });

    await future.onError((error, stackTrace) {
      throw const ServerError();
    });
  }
}
