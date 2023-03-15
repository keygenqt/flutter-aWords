import 'dart:convert';
import 'dart:math';

/// Convert object to pretty json
String jsonPrettyEncode(Object? object) =>
    const JsonEncoder.withIndent('  ').convert(object);

/// Generate values for insert
String insertEncoder(Iterable<dynamic> values) {
  final json = const JsonEncoder().convert(values.toList());
  return '(${json
      .replaceAll(RegExp(r'\["'), "['")
      .replaceAll(RegExp(r'"\]'), "']")
      .replaceAll(RegExp(r',"'), ",'")
      .replaceAll(RegExp(r'",'), "',")
      .substring(1, json.length - 1)})';
}

/// Generate random int from min-max
int random(int min, int max) {
  return min + Random().nextInt(max - min);
}