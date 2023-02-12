import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'tokens' model [TokenModel]
class TokensService {
  TokensService(this._db);

  final MyDatabase _db;

  /// Get user by ID
  Future<TokenModel?> findByKey({
    required String key,
  }) async {
    try {
      return await (_db.select(_db.tokens)
            ..where((tbl) => tbl.uniqueKey.equals(key)))
          .getSingle();
    } catch (e) {
      return null;
    }
  }

  /// Delete token by ID
  Future<void> deleteByKey({
    required String key,
  }) async {
    await (_db.delete(_db.tokens)..where((tbl) => tbl.uniqueKey.equals(key)))
        .go();
  }

  /// Insert list tokens
  Future<List<TokenModel>> insert(List<TokenModel> models) async {
    final ids = <int>[];
    await _db.transaction(() async {
      for (final model in models) {
        ids.add(await _db.into(_db.tokens).insert(model.toCompanion()));
      }
    });
    return (_db.select(_db.tokens)..where((tbl) => tbl.id.isIn(ids))).get();
  }
}
