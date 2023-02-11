import 'package:get_it/get_it.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/src/utils/db/base/database.dart';
import 'package:server_awords/src/utils/db/services/export.dart';

final getIt = GetIt.instance;

/// Initialization DI
void setupDI() {
  final db = MyDatabase();
  getIt
    // logger app level insert in runner.dart
    ..registerSingleton<Logger>(Logger())
    // init service db
    ..registerSingleton<UsersService>(UsersService(db));
}
