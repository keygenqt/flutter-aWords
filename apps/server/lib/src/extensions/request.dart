import 'dart:convert';
import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Extensions for [HttpRequest]
extension HttpRequestExt on HttpRequest {
  // logger for output
  Logger get _logger => getIt<Logger>();

  /// Write json with pretty output
  void writeJson(Object? object) => writeJsonWithCode(HttpStatus.ok, object);

  /// Write json with pretty output and set code
  void writeJsonWithCode(int code, Object? object) {
    final json = jsonPrettyEncode(object);
    response
      ..statusCode = code
      ..headers.contentType = ContentType.json
      ..contentLength = utf8.encode(json).length
      ..write(json);
  }

  /// Get body map from response
  Future<Map<String, dynamic>> getBody() async =>
      Uri.splitQueryString(await utf8.decodeStream(this));

  /// Get request id
  int getID() => int.tryParse(uri.pathSegments.last) == null
      ? 0
      : int.parse(uri.pathSegments.last);

  /// Parse routes
  Future<bool> route(Method method) async {
    // get mod path request
    final uriPath = uri.path
        .split('/')
        .map((e) => e.replaceFirst(RegExp(r'\d+'), '___'))
        .join('/');

    // get mod path api
    final apiPath = method.path
        .split('/')
        .map((e) => e.replaceFirst(RegExp(r'\{[a-z]+\}'), '___'))
        .join('/');

    if (this.method == method.method.name.toUpperCase() && uriPath == apiPath) {
      await method.func(this);
      return true;
    } else {
      return false;
    }
  }
}
