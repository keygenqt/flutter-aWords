import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/srv/app.dart';

/// Sub command server runner for run static website
class SRVCommand extends Command<int> {
  SRVCommand() {
    argParser.addOption(
      'path',
      abbr: 'p',
      help: 'Specify the path to the folder with the web flutter build.',
      mandatory: true,
    );
  }

  @override
  String get description => 'Starting the aWards flutter website.';

  @override
  String get name => 'srv';

  @override
  Future<int> run() async {
    await WebServer(argResults?['path']?.toString() ?? '').run();
    return ExitCode.success.code;
  }
}
