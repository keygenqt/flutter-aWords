import 'package:json_annotation/json_annotation.dart' as json_annotation;

part 'validates.g.dart';

@json_annotation.JsonSerializable()
class Validate {
  Validate({
    required this.field,
    required this.message,
  });

  factory Validate.fromJson(Map<String, dynamic> json) =>
      _$ValidateFromJson(json);

  final String field;
  final String message;

  Map<String, dynamic> toJson() => _$ValidateToJson(this);

  @override
  String toString() => toJson().toString();
}
