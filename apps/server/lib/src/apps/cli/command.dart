import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:server_awords/exports/apps/cli/app.dart';

/// Sub command CLI runner for command line app feature
class CLICommand extends Command<int> {
  CLICommand() {
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
      );
  }

  @override
  String get description =>
      'Basic commands for interacting with the server via the CLI.';

  @override
  String get name => 'cli';

  @override
  Future<int> run() async {
    final app = AppCLI();
    if (argResults?['backup'].toString() == 'true') {
      await app.runBackup();
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
