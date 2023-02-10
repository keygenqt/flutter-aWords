import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/api/app.dart';

import '../../../di.dart';

class APICommand extends Command<int> {

  @override
  String get description => 'Starting the aWards API.';

  @override
  String get name => 'api';

  @override
  Future<int> run() async {
    await AppServer().run();
    return ExitCode.success.code;
  }
}
