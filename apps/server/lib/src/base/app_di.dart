import 'package:get_it/get_it.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/src/clickhouse/ClickDatabase.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';

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
  // clickhouse db
  final clickhouse = ClickDatabase();
  getIt
    // logger app level insert in runner.dart
    ..registerSingleton<Logger>(Logger())
    // odbc
    ..registerSingleton<ClickDatabase>(clickhouse)
    // init service clickhouse db
    ..registerSingleton<HelloService>(HelloService(clickhouse))
    // init service sqlite db
    ..registerSingleton<CardsService>(CardsService(db))
    ..registerSingleton<TokensService>(TokensService(db))
    ..registerSingleton<UsersService>(UsersService(db));
}
