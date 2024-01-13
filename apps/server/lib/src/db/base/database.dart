import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/exports/db/migrations.dart';

part 'database.g.dart';

/// Database connect with migrations
///
/// On Linux you need to install sqlite3
/// Example on Ubuntu: `sudo apt install libsqlite3-dev`
@DriftDatabase(tables: [Users, Cards])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(
          LazyDatabase(() async {
            final file = File(p.join('./', 'db.sqlite'));
            return NativeDatabase.createInBackground(file);
          }),
        );

  // list migrations
  final _migrations = <Migrate>[];

  Logger get _logger => getIt<Logger>();

  @override
  int get schemaVersion => 1; // first version 1!

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await Migrate_0_1().onInit(this);
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
