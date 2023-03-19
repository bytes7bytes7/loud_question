import '../../domain/exceptions/request_exception.dart';

class YouAlreadyJointLobby implements RequestException {
  const YouAlreadyJointLobby();

  @override
  String get description => 'Вы уже присоединились';
}
