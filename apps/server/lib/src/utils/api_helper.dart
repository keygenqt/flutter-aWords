import 'dart:convert';

/// Convert object to pretty json
String jsonPrettyEncode(Object? object) =>
    const JsonEncoder.withIndent('  ').convert(object);
