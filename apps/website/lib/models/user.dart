import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'user.g.dart';

/// Roles for [UserModel]. Allows you to share the availability of features
enum UserRole { guest, user, admin }

/// Data class model
@JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  final int? id;
  final String name;
  final String email;
  final UserRole role;

  /// Get model from map
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());

  /// copy
  UserModel copy([Map<String, dynamic>? json]) => UserModel(
        id: json.asOrNull<int>('id') ?? id,
        name: json.asOrNull<String>('name') ?? name,
        email: json.asOrNull<String>('email') ?? email,
        role: json.asOrNull<UserRole>('role') ?? role,
      );
}
