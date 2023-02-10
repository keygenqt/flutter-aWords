import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/srv/app.dart';

class SRVCommand extends Command<int> {
  SRVCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption(
        'path',
        abbr: 'p',
        help: 'Specify the path to the folder with the web flutter build.',
        mandatory: true,
      )
      ..addFlag(
        'debug',
        negatable: false,
        help: 'Enable debug aWords website.',
      );
  }

  @override
  String get description => 'Starting the aWards flutter website.';

  @override
  String get name => 'srv';

  final Logger _logger;

  @override
  Future<int> run() async {
    await WebServer(
      argResults?['path']?.toString() ?? '',
      logger: _logger,
      debug: argResults?['debug'].toString() == 'true',
    ).run();
    return ExitCode.success.code;
  }
}
