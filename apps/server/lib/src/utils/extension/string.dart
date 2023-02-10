import 'dart:convert';
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
}

extension ConvertUint8List on Uint8List {
  String asString() {
    return String.fromCharCodes(this);
  }

  String asBase64() {
    return base64.encode(this);
  }
}
