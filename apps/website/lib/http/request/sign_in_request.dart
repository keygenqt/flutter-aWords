import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'sign_in_request.g.dart';

/// Data class model
@JsonSerializable()
class SignInRequest {
  SignInRequest({
    required this.email,
    required this.password,
    required this.uniqueKey,
  });

  final String email;
  final String password;
  final String uniqueKey;

  /// Get model from map
  factory SignInRequest.fromJson(Map<String, dynamic> json) => _$SignInRequestFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());
}
