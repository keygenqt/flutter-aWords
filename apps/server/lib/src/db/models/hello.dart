import 'dart:convert';

import 'package:dart_odbc/dart_odbc.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;

part 'hello.g.dart';

@json_annotation.JsonSerializable()
class HelloModel {
  HelloModel({
    required this.userId,
    required this.message,
    required this.timestamp,
    required this.metric,
  });

  final int userId;
  final String message;
  final String timestamp;
  final double metric;

  static HelloModel fromJson(Map<String, dynamic> json) {
    return _$HelloModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HelloModelToJson(this);

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert(toJson());

  static Map<String, SqlValue> tableMap() => {
    'userId': SqlValueInt('user_id'),
    'message': SqlValueString('message', 255),
    'timestamp': SqlValueString('timestamp', 255),
    'metric': SqlValueDouble('metric'),
  };
}
