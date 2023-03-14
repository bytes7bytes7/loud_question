import '../../../common/common.dart';

class NameIsAlreadyInUse implements RequestException {
  const NameIsAlreadyInUse();

  @override
  String get description => 'Это имя уже занято. Попробуйте другое';
}
