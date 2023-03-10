import 'package:encrypt/encrypt.dart';
import 'package:server_awords/exports/other/utils.dart';
import 'package:server_awords/src/base/app_di.dart';

/// AES encrypt/decrypt data with secret key
class Crypto {
  static String secret = Configuration.secret;

  static String encrypt(String value) {
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    return Encrypter(AES(key)).encrypt(value, iv: iv).base64;
  }

  static String decrypt(String value) {
    final key = Key.fromUtf8(secret);
    final iv = IV.fromLength(16);
    return Encrypter(AES(key)).decrypt64(value, iv: iv);
  }
}
