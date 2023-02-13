import 'package:drift/drift.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';

/// Service for table 'users' model [UserModel]
class UsersService {
  UsersService(this._db);

  final MyDatabase _db;

  /// Get all users
  Future<List<UserModel>> getAll() async {
    return _db.select(_db.users).get();
  }

  /// Get user by email
  Future<UserModel?> findByEmail({
    required String email,
  }) async {
    try {
      return await (_db.select(_db.users)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingle();
    } catch (e) {
      return null;
    }
  }

  /// Get user by email, password
  Future<UserModel?> findByEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      return await (_db.select(_db.users)
            ..where(
              (tbl) =>
                  tbl.email.equals(email) &
                  tbl.password.equals(password.asMD5()),
            ))
          .getSingle();
    } catch (e) {
      return null;
    }
  }

  /// Get user by ID
  Future<UserModel?> findById({
    required int id,
  }) async {
    try {
      return await (_db.select(_db.users)..where((tbl) => tbl.id.equals(id)))
          .getSingle();
    } catch (e) {
      return null;
    }
  }

  /// Delete user by ID
  Future<int> deleteItem({
    required int id,
  }) async {
    return (_db.delete(_db.users)..where((tbl) => tbl.id.equals(id))).go();
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
