import 'package:get_it/get_it.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/utils/db/base/database.dart';
import 'package:server_awords/src/utils/db/services/export.dart';

final getIt = GetIt.instance;

void setupDI() {
  final db = MyDatabase();
  getIt
    ..registerSingleton<Logger>(Logger())
    ..registerSingleton<CategoriesService>(CategoriesService(db));
}
