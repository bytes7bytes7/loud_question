import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'main/main.dart';

final _logger = Logger('Main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _configLogger(printLogs: true);

  _logger.info('App is started');

  await configInjector(env: 'prod');

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
