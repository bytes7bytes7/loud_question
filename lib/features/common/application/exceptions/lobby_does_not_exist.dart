import '../../domain/exceptions/request_exception.dart';

class LobbyDoesNotExist implements RequestException {
  const LobbyDoesNotExist();

  @override
  String get description => 'Лобби не найдено';
}
