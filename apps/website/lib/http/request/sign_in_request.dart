import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

/// Data class model
@JsonSerializable()
class SignInRequest {
  SignInRequest({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  /// Get model from map
  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());
}
