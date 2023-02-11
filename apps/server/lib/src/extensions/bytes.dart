import 'dart:convert';
import 'dart:typed_data';

/// Extensions for [Uint8List]
extension Uint8ListExt on Uint8List {
  /// Convert [Uint8List] to [String]
  String asString() {
    return String.fromCharCodes(this);
  }

  /// Convert [Uint8List] to Base64 string
  String asBase64() {
    return base64.encode(this);
  }
}
