import 'package:drift/drift.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'tokens' model [TokenModel]
class TokensService {
  TokensService(this._db);

  final MyDatabase _db;

  /// Get token by key
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

  /// Get token by key
  Future<TokenModel?> findByKeyAndHash({
    required String key,
    required String hash,
  }) async {
    try {
      return await (_db.select(_db.tokens)
            ..where(
              (tbl) => tbl.uniqueKey.equals(key) & tbl.token.equals(hash),
            ))
          .getSingle();
    } catch (e) {
      return null;
    }
  }

  /// Delete token by uniqueKey
  Future<int> deleteByKey({
    required String key,
  }) async {
    return (_db.delete(_db.tokens)..where((tbl) => tbl.uniqueKey.equals(key)))
        .go();
  }

  /// Delete token by token
  Future<int> deleteByToken({
    required String token,
  }) async {
    return (_db.delete(_db.tokens)..where((tbl) => tbl.token.equals(token)))
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
