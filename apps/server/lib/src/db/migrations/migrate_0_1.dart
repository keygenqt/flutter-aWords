import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/other/extensions.dart';

// ignore_for_file: camel_case_types
// set demo data
class Migrate_0_1 {
  Future<void> onInit(MyDatabase d) async {
    // insert demo users
    await setUsers(d);
    // insert demo cards
    // @todo
  }

  // insert demo users
  Future<void> setUsers(MyDatabase d) async {
    // get actual table name
    final usersTable = d.users.actualTableName;

    // get columns table
    final usersColumns = d.users.columnsByName.keys
        .where((e) => e != 'id')
        .map((e) => '"$e"')
        .join(',');

    // insert values
    await d.customInsert('''
INSERT INTO "$usersTable" ($usersColumns) VALUES
  ("Оля", "best1@email.com", "${'12345678'.asMD5()}"),
  ("Юля", "best2@email.com", "${'12345678'.asMD5()}"),
  ("Муля", "best3@email.com", "${'12345678'.asMD5()}"),
  ("Гуля", "best4@email.com", "${'12345678'.asMD5()}");
''');
  }
}
