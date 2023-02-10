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
    // @todo
    // Not the best way to use migrations, it's worth removing the field and
    // the application will not build
    await m.addColumn(d.users, d.users.name);
  }
}
