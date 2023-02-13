import 'package:get_it/get_it.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/utils.dart';

final getIt = GetIt.instance;

/// Initialization application DI
/// Services
/// [TokensService]
/// [UsersService]
/// Other
/// [Logger]
void setupDI() {
  final db = MyDatabase();
  getIt
    // logger app level insert in runner.dart
    ..registerSingleton<Logger>(Logger())
    // configuration
    ..registerSingleton<Configuration>(Configuration())
    // init service db
    ..registerSingleton<TokensService>(TokensService(db))
    ..registerSingleton<UsersService>(UsersService(db));
}
