import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/di.dart';
import 'package:server_awords/src/api/app.dart';

class APICommand extends Command<int> {
  APICommand() {
    argParser
      ..addOption(
        'path',
        help: 'Set path to home page web site.',
        defaultsTo: 'web',
      )
      ..addOption(
        'port',
        help: 'Set port for API run.',
        defaultsTo: '3000',
      );
  }

  @override
  String get description => 'Starting the aWards API.';

  @override
  String get name => 'api';

  Logger get _logger => getIt<Logger>();

  @override
  Future<int> run() async {

    final path = argResults?['path']?.toString() ?? '';
    final port = argResults?['port']?.toString() ?? '';

    if (int.tryParse(port) == null || int.parse(port) < 1) {
      _logger.err('--port value must be a positive integer.');
      return ExitCode.noInput.code;
    }
    await AppServer(
        path: path,
        port: int.parse(port),
    ).run();
    return ExitCode.success.code;
  }
}
