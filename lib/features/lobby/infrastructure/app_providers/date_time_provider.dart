import 'package:injectable/injectable.dart';

import '../../application/application.dart';

@Singleton(as: DateTimeProvider)
class ProdDateTimeProvider implements DateTimeProvider {
  const ProdDateTimeProvider();

  @override
  DateTime now() {
    return DateTime.now();
  }
}
