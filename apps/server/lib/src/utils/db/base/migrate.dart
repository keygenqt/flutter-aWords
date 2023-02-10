import 'package:drift/drift.dart';
import 'package:server_awords/src/utils/db/base/export.dart';

mixin Migrate {
  Future<void> onUpgrade(MyDatabase d, Migrator m, int from, int to);
}
