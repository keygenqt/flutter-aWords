import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:pointycastle/digests/md5.dart';

extension ConvertString on String {
  String asMD5() {
    return MD5Digest().process(asUint8List()).asBase64();
  }

  bool validateMD5(String hash) {
    return MD5Digest().process(asUint8List()).asBase64() == hash;
  }

  Uint8List asUint8List() {
    return Uint8List.fromList(codeUnits);
  }

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

extension ConvertUint8List on Uint8List {
  String asString() {
    return String.fromCharCodes(this);
  }

  String asBase64() {
    return base64.encode(this);
  }
}
