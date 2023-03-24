import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:ntp/ntp.dart';

import '../../application/application.dart';

@Singleton(as: DateTimeProvider)
class ProdDateTimeProvider implements DateTimeProvider {
  Timer? _timer;
  var _offset = 0;

  @override
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await _sync();
    _timer = Timer(const Duration(minutes: 10), _sync);
  }

  @override
  @disposeMethod
  void dispose() {
    _timer?.cancel();
  }

  @override
  DateTime now() => DateTime.now().toUtc().add(Duration(milliseconds: _offset));

  Future<void> _sync() async {
    final dt = DateTime.now().toLocal();

    try {
      _offset = await NTP.getNtpOffset(
        localTime: dt,
        lookUpAddress: 'time.google.com',
        timeout: const Duration(seconds: 5),
      );
    } catch (e) {
      // maybe running in emulator
    }
  }
}
