import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:pointycastle/digests/md5.dart';
import 'package:server_awords/src/extensions/bytes.dart';

/// Extensions for [String]
extension ExtString on String {
  /// Capitalize string
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Convert string to MD5
  String asMD5() {
    return MD5Digest().process(asUint8List()).asBase64();
  }

  /// Convert string to MD5 with validate
  bool validateMD5(String hash) {
    return MD5Digest().process(asUint8List()).asBase64() == hash;
  }

  /// Convert string to bites
  Uint8List asUint8List() {
    return Uint8List.fromList(utf8.encode(this));
  }

  /// Convert string to [ContentType]
  ContentType getContentType() {
    if (contains('.html')) {
      return ContentType.parse('text/html');
    }
    if (contains('.js')) {
      return ContentType.parse('text/javascript');
    }
    if (contains('.json')) {
      return ContentType.parse('application/json');
    }
    if (contains('.png')) {
      return ContentType.parse('image/png');
    }
    if (contains('.css')) {
      return ContentType.parse('text/css');
    }
    if (contains('.ico')) {
      return ContentType.parse('image/vnd.microsoft.icon');
    }
    if (contains('.otf')) {
      return ContentType.parse('font/otf');
    }
    if (contains('.ttf')) {
      return ContentType.parse('font/ttf');
    }
    return ContentType.parse('application/unknown');
  }
}
