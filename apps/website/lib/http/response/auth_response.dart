import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'auth_response.g.dart';

/// Data class model
@JsonSerializable()
class AuthResponse {
  AuthResponse({
    required this.userId,
    required this.token,
    required this.uniqueKey,
    required this.createAt,
  });

  final int userId;
  final String token;
  final String uniqueKey;
  final DateTime createAt;

  /// Get model from map
  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());

  /// copy
  AuthResponse copy([Map<String, dynamic>? json]) => AuthResponse(
        userId: json.asOrNull<int>('userId') ?? userId,
        token: json.asOrNull<String>('token') ?? token,
        uniqueKey: json.asOrNull<String>('email') ?? uniqueKey,
        createAt: json.asOrNull<DateTime>('createAt') ?? createAt,
      );
}
