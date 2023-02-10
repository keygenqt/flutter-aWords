import 'package:server_awords/src/utils/db/export.dart';

class CategoriesService {
  CategoriesService(this._db);

  final MyDatabase _db;

  /// Get all categories
  Future<List<CategoryModel>> getAll() async {
    return _db.select(_db.categories).get();
  }

  /// Insert list categories
  Future<void> insert(List<CategoryModel> models) async {
    await _db.transaction(() async {
      for (final model in models) {
        await _db.into(_db.categories).insert(model.toCompanion());
      }
    });
  }

  /// Update list categories
  Future<void> update(List<CategoryModel> models) async {
    await _db.transaction(() async {
      for (final model in models) {
        await (_db.update(_db.categories)
              ..where((row) => row.id.equals(model.id!)))
            .write(model.toCompanion());
      }
    });
  }
}
