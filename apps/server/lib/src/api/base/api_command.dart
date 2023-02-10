import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/api/app.dart';

class APICommand extends Command<int> {
  APICommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'debug',
      negatable: false,
      help: 'Enable debug aWords API.',
    );
  }

  @override
  String get description => 'Starting the aWards API.';

  @override
  String get name => 'api';

  final Logger _logger;

  @override
  Future<int> run() async {
    await AppServer(
      logger: _logger,
      debug: argResults?['debug'].toString() == 'true',
    ).run();
    return ExitCode.success.code;
  }
}
