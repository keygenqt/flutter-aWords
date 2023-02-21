import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'cards' model [CardModel]
class CardsService {
  CardsService(this._db);

  final MyDatabase _db;

  /// Get all cards
  Future<List<CardModel>> getAll() async {
    return _db.select(_db.cards).get();
  }
}
