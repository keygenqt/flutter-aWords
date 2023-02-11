import 'dart:convert';

String jsonPrettyEncode(Object? object) =>
    const JsonEncoder.withIndent('  ').convert(object);
