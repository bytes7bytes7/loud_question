import '../../common.dart';

class InvalidCredentials implements RequestException {
  const InvalidCredentials();

  @override
  String get description => 'Неверный логин и/или пароль';
}
