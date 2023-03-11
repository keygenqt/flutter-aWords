// import 'package:dart_odbc/src/sql_types_odbc.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/clickhouse/ClickDatabase.dart';
import 'package:server_awords/src/db/models/hello.dart';

/// Service for table 'hello' model [HelloModel]
class HelloService {
  HelloService(this._db) : table = _db.getPath(HelloService);

  final ClickDatabase _db;
  final String table;

  /// Get all hello
  List<HelloModel> getAll() {
    return _db.fetch("SELECT * FROM $table", HelloModel.tableMap()).map((json) => HelloModel.fromJson(json)).toList();
  }

  /// Insert hello
  void insert(List<HelloModel> models) {
    if (models.isNotEmpty) {
      String query = 'INSERT INTO $table ${HelloModel.tableMap().values.map((v) => v.name)} VALUES';
      List<String> values = [];
      models.forEach((element) {
        values.add(insertEncoder(element.toJson().values));
      });
      _db.exec('$query ${values.join(',')}');
    }
  }

  /// Clear table
  void clear() {
    _db.exec('TRUNCATE TABLE IF EXISTS $table');
  }
}
