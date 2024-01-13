import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:crypto/crypto.dart';

/// AES encrypt/decrypt data with secret key
class Crypto {
  static String secret = Configuration.secret;

  /// Encrypt data
  static String encrypt(String value) {
    var ivStr = sha256.convert(utf8.encode(secret)).toString().substring(0, 16);
    var keyStr = sha256.convert(utf8.encode(secret)).toString().substring(0, 32);
    IV iv = IV.fromUtf8(ivStr);
    Key key = Key.fromUtf8(keyStr);
    return Encrypter(AES(key)).encrypt(value, iv: iv).base64;
  }

  /// Decrypt data
  static String decrypt(String value) {
    var ivStr = sha256.convert(utf8.encode(secret)).toString().substring(0, 16);
    var keyStr = sha256.convert(utf8.encode(secret)).toString().substring(0, 32);
    IV iv = IV.fromUtf8(ivStr);
    Key key = Key.fromUtf8(keyStr);
    return Encrypter(AES(key)).decrypt64(value, iv: iv);
  }
}
