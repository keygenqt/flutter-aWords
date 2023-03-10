import 'package:dart_odbc/dart_odbc.dart';
import 'package:path/path.dart' as path;
import 'package:server_awords/exports/other/utils.dart';

class ClickDatabase extends DartODBC {
  ClickDatabase() : super(path: path.join('/lib/x86_64-linux-gnu/libodbc.so')) {
    if (!connect(
      server: Configuration.server,
      username: Configuration.username,
      password: Configuration.password,
    )) {
      throw Exception('${Configuration.server} connection error!');
    } else {
      init();
    }
  }

  void init() {}
}
