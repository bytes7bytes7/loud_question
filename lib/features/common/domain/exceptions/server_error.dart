import 'request_exception.dart';

class ServerError implements RequestException {
  const ServerError();

  @override
  String get description => 'Ошибка на сервере.'
      ' Пожалуйста, подождите, пока проблема не будет исправлена';
}
