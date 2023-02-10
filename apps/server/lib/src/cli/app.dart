import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/di.dart';
import 'package:server_awords/src/utils/db/export.dart';
import 'package:server_awords/src/utils/db/services/export.dart';

class AppCLI {

  Logger get _logger => getIt<Logger>();
  CategoriesService get _service => getIt<CategoriesService>();

  Future<void> runBackup() async {

    // create list models
    final insert = <CategoryModel>[
      CategoryModel.create(
        title: 'Category one',
        description: 'description',
      ),
      CategoryModel.create(
        title: 'Category second',
        description: 'description',
      )
    ];

    // insert data
    await _service.insert(insert);

    // read data
    final list = await _service.getAll();

    // show result
    _logger.info('Models: $list');

    // update model
    list[0] = list[0].clone(title: 'UPDATE TITLE');

    // update data
    await _service.update(list);

    // read data
    final listAfterUpdate = await _service.getAll();

    // show result
    _logger.info('Models update: $listAfterUpdate');
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
