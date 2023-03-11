import 'package:dart_odbc/dart_odbc.dart';
import 'package:path/path.dart' as path;
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';
import 'package:server_awords/src/clickhouse/services/state_service.dart';

class ClickDatabase extends DartODBC {

  // db name
  final dbname = 'awords';

  // tables
  final tables = {
    HelloService: 'my_first_table',
    StateService: 'state'
  };

  String getPath(Type type) => '$dbname.${tables[type]}';

  ClickDatabase() : super(path: path.join('/lib/x86_64-linux-gnu/libodbc.so')) {
    if (!connect(
      server: Configuration.server,
      username: Configuration.username,
      password: Configuration.password,
    )) {
      throw Exception('${Configuration.server} connection error!');
    } else {
      initDB();
      initFirstTable();
      initStateTable();
    }
  }

  void initDB() {
    exec('CREATE DATABASE IF NOT EXISTS $dbname');
  }

  void initFirstTable() {
    exec("""
CREATE TABLE IF NOT EXISTS ${getPath(HelloService)}
(
    user_id UInt32,
    message String,
    timestamp DateTime,
    metric Float32
)
ENGINE = MergeTree()
PRIMARY KEY (user_id, timestamp)
    """);
  }

  void initStateTable() {
    exec("""
CREATE TABLE IF NOT EXISTS ${getPath(StateService)}
(
    word String,
    state UInt8,
    user_id UInt32,
    timestamp UInt64,
)
ENGINE = MergeTree()
PRIMARY KEY (user_id, timestamp)
    """);
  }
}
