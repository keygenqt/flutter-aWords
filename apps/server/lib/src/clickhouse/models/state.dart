import 'dart:convert';

import 'package:dart_odbc/dart_odbc.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;

part 'state.g.dart';

@json_annotation.JsonSerializable()
class StateModel {
  StateModel({
    required this.word,
    required this.language,
    required this.state,
    required this.userId,
    required this.timestamp,
  });

  final String word;
  final String language;
  final bool state;
  final int userId;
  final int timestamp;

  static StateModel fromJson(Map<String, dynamic> json) {
    return _$StateModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StateModelToJson(this);

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert(toJson());

  static Map<String, SqlValue> tableMap() => {
    'word': SqlValueString('word', 255),
    'language': SqlValueString('language', 5),
    'state': SqlValueBool('state'),
    'userId': SqlValueInt('user_id'),
    'timestamp': SqlValueInt64('timestamp'),
  };
}
