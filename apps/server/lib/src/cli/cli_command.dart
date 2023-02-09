import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/cli/app.dart';

class CLICommand extends Command<int> {
  CLICommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addFlag(
        'backup',
        help: 'Backup files.',
        negatable: false,
      )
      ..addFlag(
        'backup-db',
        help: 'Backup database.',
        negatable: false,
      )
      ..addFlag(
        'cleaner',
        help: 'Cleaner files without relations in db.',
        negatable: false,
      )
      ..addFlag(
        'debug',
        help: 'Get more information on the process.',
        negatable: false,
      );
  }

  @override
  String get description =>
      'Basic commands for interacting with the server via the CLI.';

  @override
  String get name => 'cli';

  final Logger _logger;

  @override
  Future<int> run() async {
    final app = AppCLI(
      logger: _logger,
      debug: argResults?['debug'].toString() == 'true',
    );
    if (argResults?['backup'].toString() == 'true') {
      app.runBackup();
    } else if (argResults?['backup-db'].toString() == 'true') {
      app.runBackupDB();
    } else if (argResults?['cleaner'].toString() == 'true') {
      app.runCleaner();
    } else {
      printUsage();
    }
    return ExitCode.success.code;
  }
}
