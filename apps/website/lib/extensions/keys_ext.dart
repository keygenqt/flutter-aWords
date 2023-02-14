import 'package:flutter/material.dart';

/// Extensions for [GlobalKey]
extension ExtGlobalKey on GlobalKey {
  /// Get height by key
  double? getHeight() {
    if (currentContext == null) {
      return null;
    }
    final renderBoxRed = currentContext!.findRenderObject() as RenderBox;
    final sizeRed = renderBoxRed.size;
    return sizeRed.height;
  }
}
