import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

/// Data class model
@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  /// Get model from map
  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());
}
