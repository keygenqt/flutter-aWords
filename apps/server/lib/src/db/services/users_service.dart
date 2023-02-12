import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'users' model [UserModel]
class UsersService {
  UsersService(this._db);

  final MyDatabase _db;

  /// Get all users
  Future<List<UserModel>> getAll() async {
    return _db.select(_db.users).get();
  }

  /// Get user by ID
  Future<UserModel> getItem(int id) async {
    return (_db.select(_db.users)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Get user by ID
  Future<void> deleteItem(int id) async {
    final count =
        await (_db.delete(_db.users)..where((tbl) => tbl.id.equals(id))).go();
    if (count == 0) {
      throw AppException.notFound();
    }
  }

  /// Insert list users
  Future<List<UserModel>> insert(List<UserModel> models) async {
    final ids = <int>[];
    await _db.transaction(() async {
      for (final model in models) {
        ids.add(await _db.into(_db.users).insert(model.toCompanion()));
      }
    });
    return (_db.select(_db.users)..where((tbl) => tbl.id.isIn(ids))).get();
  }

  /// Update list users
  Future<List<UserModel>> update(List<UserModel> models) async {
    await _db.transaction(() async {
      for (final model in models) {
        await (_db.update(_db.users)..where((row) => row.id.equals(model.id!)))
            .write(model.toCompanion());
      }
    });
    return (_db.select(_db.users)
          ..where((tbl) => tbl.id.isIn(models.map((e) => e.id!))))
        .get();
  }
}
