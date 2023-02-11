import 'dart:convert';
import 'dart:io';

import 'package:server_awords/exports/other/utils.dart';

/// Extensions for [HttpRequest]
extension ExtRequest on HttpRequest {
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

  /// get body map from response
  Future<Map<String, dynamic>> getBody() async =>
      Uri.splitQueryString(await utf8.decodeStream(this));
}
