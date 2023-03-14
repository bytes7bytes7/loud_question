import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/domain/domain.dart';
import '../../auth.dart';

@singleton
class AuthService {
  AuthService({
    required AuthProvider authProvider,
  }) : _authProvider = authProvider;

  final AuthProvider _authProvider;
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

    final response = await _authProvider.register(request);

    response.value.fold(
      (l) {
        // TODO: add throwing exceptions
        _userController.add(null);
      },
      (r) {
        // TODO: save data
        _userController.add(r.user);
      },
    );
  }

  Future<void> logIn({
    required String name,
    required String password,
  }) async {}
}
