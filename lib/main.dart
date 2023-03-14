import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:url_strategy/url_strategy.dart';

import 'main/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _configLogger(printLogs: true);
  configInjector(env: 'prod');
  setPathUrlStrategy();

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
