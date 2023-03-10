import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';

/// Service for table 'hello' model [HelloModel]
class HelloService {
  HelloService(this._db) : table = _db.getPath(HelloService);

  final ClickDatabase _db;
  final String table;

  /// Get all hello
  List<HelloModel> getAll() {
    return _db
        .fetch(
          "SELECT * FROM $table",
          HelloModel.tableMap(),
        )
        .map((json) => HelloModel.fromJson(json))
        .toList();
  }

  /// Insert hello
  void insert(List<HelloModel> models) {
    if (models.isNotEmpty) {
      _db.exec('''
      INSERT INTO $table ${HelloModel.tableMap().values.map((v) => v.name)} VALUES 
      ${models.map((e) => insertEncoder(e.toJson().values)).join(',')}
      ''');
    }
  }

  /// Clear table
  void clear() {
    _db.exec('TRUNCATE TABLE IF EXISTS $table');
  }
}
