import 'dart:io';

import 'package:server_awords/di.dart';
import 'package:server_awords/runner.dart';

Future<void> main(List<String> args) async {
  setupDI();
  await _flushThenExit(await ServerCommandRunner().run(args));
}

Future<void> _flushThenExit(int status) {
  return Future.wait<void>([stdout.close(), stderr.close()])
      .then<void>((_) => exit(status));
}