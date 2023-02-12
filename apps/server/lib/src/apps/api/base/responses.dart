import 'dart:io';

import 'package:json_annotation/json_annotation.dart' as json_annotation;

part 'responses.g.dart';

/// Success response
@json_annotation.JsonSerializable()
class SuccessResponse {
  SuccessResponse([this.message = 'OK']);

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);

  int code = HttpStatus.ok;
  String message;

  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
