import 'dart:io';

import 'package:server_awords/exports/other/commands.dart';
import 'package:server_awords/src/base/app_di.dart';

Future<void> main(List<String> args) async {
  setupDI();
  await _flushThenExit(await RootCommand().run(args));
}

Future<void> _flushThenExit(int status) {
  return Future.wait<void>([stdout.close(), stderr.close()])
      .then<void>((_) => exit(status));
}
