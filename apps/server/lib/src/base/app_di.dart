import 'package:get_it/get_it.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/services.dart';

final getIt = GetIt.instance;

/// Initialization application DI
/// Services
/// [TokensService]
/// [UsersService]
/// Other
/// [Logger]
void setupDI() {
  // sqlite db
  final db = MyDatabase();
  getIt
    // logger app level insert in runner.dart
    ..registerSingleton<Logger>(Logger())
    // init service sqlite db
    ..registerSingleton<CardsService>(CardsService(db))
    ..registerSingleton<UsersService>(UsersService(db));
}
