import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'auth_request.g.dart';

/// Data class model
@JsonSerializable()
class AuthRequest {
  AuthRequest({
    required this.email,
    required this.password,
    required this.uniqueKey,
  });

  final String email;
  final String password;
  final String uniqueKey;

  /// Get model from map
  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());
}
