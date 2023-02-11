import 'package:drift/drift.dart';
import 'package:server_awords/exports/db/database.dart';

/// Interface for migrations classes
mixin Migrate {
  Future<void> onUpgrade(MyDatabase d, Migrator m, int from, int to);
}
