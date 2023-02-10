// To open the database, add these imports to the existing file defining the
// database class. They are used to open the database.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:server_awords/di.dart';
import 'package:server_awords/src/utils/db/base/migrate.dart';
import 'package:server_awords/src/utils/db/export.dart';
import 'package:server_awords/src/utils/db/migrations/export.dart';

part 'database.g.dart';

// On Linux you need to install sqlite3
// Example on Ubuntu: `sudo apt install libsqlite3-dev`

@DriftDatabase(tables: [Categories])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(
          LazyDatabase(() async {
            final file = File(p.join('./', 'db.sqlite'));
            return NativeDatabase.createInBackground(file);
          }),
        );

  // list migrations
  final _migrations = <Migrate>[
    Migrate_1_2(),
  ];

  Logger get _logger => getIt<Logger>();

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        _logger.delayed('Migration: ${from}_$to');
        for (final migrate in _migrations
            .where((element) => element.toString().contains('${from}_$to'))) {
          await migrate.onUpgrade(this, m, from, to);
        }
      },
    );
  }
}
