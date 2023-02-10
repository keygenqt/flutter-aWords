import 'package:drift/drift.dart';
import 'package:server_awords/src/utils/db/base/database.dart';
import 'package:server_awords/src/utils/db/base/migrate.dart';

// ignore_for_file: camel_case_types
class Migrate_1_2 implements Migrate {
  @override
  Future<void> onUpgrade(
    MyDatabase d,
    Migrator m,
    int from,
    int to,
  ) async {
    await m.addColumn(d.categories, d.categories.title);
  }
}
