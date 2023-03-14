import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'main/infrastructure/injector/injector.dart';
import 'main/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _configLogger(printLogs: true);
  configInjector(env: 'prod');

  runApp(const App());
}

void _configLogger({required bool printLogs}) {
  if (printLogs && kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      // ignore: avoid_print
      print(
        '[${record.time}] '
        '${record.level.name} | '
        '${record.loggerName}: '
        '${record.message}',
      );
    });
  }
}
