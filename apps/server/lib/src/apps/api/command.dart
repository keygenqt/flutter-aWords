import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io' show Platform, Directory;
import 'dart:io';

import 'package:args/command_runner.dart';
import "package:ffi/ffi.dart";
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as path1;
import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/src/base/app_di.dart';

typedef Select = Pointer<Utf8> Function();

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
    // var libraryPath = path1.join(Directory.current.path, 'releaseShared', 'libnative.so');
    // final dylib = ffi.DynamicLibrary.open(libraryPath);
    // final lib = NativeLibrary(dylib);
    // final myBestFunction = lib.libnative_symbols().ref.kotlin.root.example.myBestFunction.asFunction<double Function(double)>();
    // _logger.err(myBestFunction(2).toString());

    var libraryPath = path1.join(Directory.current.path, 'odbc', 'build', 'libdart_odbc.so');
    final dylib = ffi.DynamicLibrary.open(libraryPath);
    final select = dylib.lookupFunction<Select, Select>('select');

    _logger.err("clickhouse dart! ------------------\n");
    _logger.err(select().toDartString());
    _logger.err("-----------------------------------");

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
}
