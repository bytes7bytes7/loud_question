import '../../domain/exceptions/request_exception.dart';

class WrongLobbyPassword implements RequestException {
  const WrongLobbyPassword();

  @override
  String get description => 'Неверный пароль';
}
