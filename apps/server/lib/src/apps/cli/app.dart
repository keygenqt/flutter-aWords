import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Main class application CLI
class AppCLI {
  Logger get _logger => getIt<Logger>();

  UsersService get _service => getIt<UsersService>();

  /// Create backup files
  Future<void> runBackup() async {
    // create list models
    final insert = <UserModel>[
      UserModel.create(
        name: 'New user',
        email: 'new@gmail.com',
        password: '12345678'.asMD5(),
      ),
    ];

    // insert data
    await _service.insert(insert);

    // read data
    final list = await _service.getAll();

    // show result
    _logger.info('Models: $list');

    // update data
    await _service.update([list[0].copy({
      'name': 'UPDATE NAME'
    })]);

    // read data
    final listAfterUpdate = await _service.getAll();

    // show result
    _logger.info('Models update: $listAfterUpdate');
  }

  /// Create backup database
  void runBackupDB() {
    // @todo feature backup db
    _logger
      ..info('Run backup DB')
      ..detail('Run backup DB debug log');
  }

  /// Cleaner files without relations in db
  void runCleaner() {
    // @todo feature cleaner
    _logger
      ..info('Run cleaner')
      ..detail('Run cleaner debug log');
  }
}
