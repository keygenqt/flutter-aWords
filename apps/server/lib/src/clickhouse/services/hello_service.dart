import 'package:dart_odbc/src/wrappers_odbc.dart';
import 'package:server_awords/src/clickhouse/ClickDatabase.dart';
import 'package:server_awords/src/db/models/hello.dart';

/// Service for table 'hello' model [HelloModel]
class HelloService {
  HelloService(this._db);

  final ClickDatabase _db;

  /// Get all hello
  List<HelloModel> getAll() {
    return _db
        .query("SELECT * FROM helloworld.my_first_table", {
          'userId': SqlValueInt(),
          'message': SqlValueString(255),
          'timestamp': SqlValueString(255),
          'metric': SqlValueDouble(),
        })
        .map((json) => HelloModel.fromJson(json))
        .toList();
  }
}
