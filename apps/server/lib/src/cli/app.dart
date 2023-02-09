import 'package:mason_logger/mason_logger.dart';

class AppCLI {
  AppCLI({
    required Logger logger,
    required bool debug,
  }) : _logger = logger {
    logger.level = debug ? Level.debug : Level.info;
  }

  final Logger _logger;

  void runBackup() {
    // @todo feature backup files
    _logger
      ..info('Run backup')
      ..detail('Run backup debug log');
  }

  void runBackupDB() {
    // @todo feature backup db
    _logger
      ..info('Run backup DB')
      ..detail('Run backup DB debug log');
  }

  void runCleaner() {
    // @todo feature cleaner
    _logger
      ..info('Run cleaner')
      ..detail('Run cleaner debug log');
  }
}
