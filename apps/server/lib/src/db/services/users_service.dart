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

  /// Insert list users
  Future<void> insert(List<UserModel> models) async {
    await _db.transaction(() async {
      for (final model in models) {
        await _db.into(_db.users).insert(model.toCompanion());
      }
    });
  }

  /// Update list users
  Future<void> update(List<UserModel> models) async {
    await _db.transaction(() async {
      for (final model in models) {
        await (_db.update(_db.users)..where((row) => row.id.equals(model.id!)))
            .write(model.toCompanion());
      }
    });
  }
}
