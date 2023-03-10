import 'package:args/command_runner.dart';
import 'package:dart_odbc/dart_odbc.dart';
import 'package:dart_odbc/src/wrappers_odbc.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path;
import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/base/app_di.dart';

import '../../db/models/hello.dart';

/// Sub command CLI runner for API
class APICommand extends Command<int> {
  APICommand() {
    argParser
      ..addOption(
        'path',
        help: 'Set path to home page web site.',
        defaultsTo: 'public',
      )
      ..addOption(
        'port',
        help: 'Set port for API run.',
        defaultsTo: '3000',
      );
  }

  @override
  String get description => 'Starting the aWards API.';

  @override
  String get name => 'api';

  Logger get _logger => getIt<Logger>();

  @override
  Future<int> run() async {

    runTestODBC();

    final path = argResults?['path']?.toString() ?? '';
    final port = argResults?['port']?.toString() ?? '';

    if (int.tryParse(port) == null || int.parse(port) < 1) {
      _logger.err('--port value must be a positive integer.');
      return ExitCode.noInput.code;
    }
    await AppServer(
      path: path,
      port: int.parse(port),
    ).run();
    return ExitCode.success.code;
  }

  void runTestODBC() {
    final odbc = DartODBC(
      path: path.join('/lib/x86_64-linux-gnu/libodbc.so'),
    );

    if (odbc.connect(
      server: Configuration.server,
      username: Configuration.username,
      password: Configuration.password,
    )) {
      print('Success connect');

      final result = odbc.query("SELECT * FROM helloworld.my_first_table", {
        'userId': SqlValueInt(),
        'message': SqlValueString(255),
        'timestamp': SqlValueString(255),
        'metric': SqlValueDouble(),
      });

      final models = result.map((json) => HelloModel.fromJson(json));

      print(models);

      if (odbc.disconnect()) {
        print('Success disconnect');
      }
    } else {
      print('Error connect');
    }
  }
}
