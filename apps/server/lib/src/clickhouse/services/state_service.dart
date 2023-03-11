import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'state' model [StateModel]
class StateService {
  StateService(this._db) : table = _db.getPath(StateService);

  final ClickDatabase _db;
  final String table;

  /// Get all state
  List<StateModel> getAll() {
    return _db
        .fetch(
          'SELECT * FROM $table',
          StateModel.tableMap(),
        )
        .map((json) => StateModel.fromJson(json))
        .toList();
  }

  /// Insert state
  void insert(List<StateModel> models) {
    if (models.isNotEmpty) {
      _db.exec('''
      INSERT INTO $table ${StateModel.tableMap().values.map((v) => v.name)} VALUES 
      ${models.map((e) => insertEncoder(e.toJson().values)).join(',')}
      ''');
    }
  }

  /// Clear table
  void clear() {
    _db.exec('TRUNCATE TABLE IF EXISTS $table');
  }
}
