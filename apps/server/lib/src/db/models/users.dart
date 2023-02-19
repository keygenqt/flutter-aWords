import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;
import 'package:json_annotation/json_annotation.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/exports/other/utils.dart';

part 'users.g.dart';

/// Table 'users' drift
@UseRowClass(UserModel)
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get password => text()();

  IntColumn get role => intEnum<UserRole>()();
}

/// Roles for [UserModel]. Allows you to share the availability of features
enum UserRole { guest, user, admin }

/// Model app table 'users'
@json_annotation.JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // set default role
    json['role'] = json['role'] ?? UserRole.user.name;
    // pass to md5
    json['password'] = json['password'].toString().asMD5();
    // create class
    return _$UserModelFromJson(json);
  }

  UserModel.create({
    required this.name,
    required this.email,
    required this.password,
    this.role = UserRole.user,
  }) : id = null;

  final int? id;
  final String name;
  final String email;
  final UserRole role;

  @json_annotation.JsonKey(includeToJson: false)
  final String password;

  bool get isNew => id == null;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() => toJson().toString();

  UsersCompanion toCompanion() {
    if (isNew) {
      return UsersCompanion.insert(
        name: name,
        email: email,
        password: password,
        role: role,
      );
    } else {
      return UsersCompanion(
        id: Value(id ?? 0),
        name: Value(name),
        email: Value(email),
        password: Value(password),
        role: Value(role),
      );
    }
  }

  UserModel clone(Map<String, dynamic> json) => UserModel(
        id: id ?? 0,
        name: json['name']?.toString() ?? name,
        email: json['email']?.toString() ?? email,
        password: json['password']?.toString().asMD5() ?? password,
        role: json['role'] == null || int.tryParse(json['role'].toString()) == null
            ? role
            : UserRole.values[int.parse(json['role'].toString())],
      );

  String generateToken() {
    return Crypto.encrypt(const JsonEncoder().convert(this));
  }

  String generateCookieSecret(
    String token,
    String uniqueKey,
    DateTime createAt,
  ) {
    return Crypto.encrypt(const JsonEncoder().convert({
      'basic': 'Basic ${token}',
      'uniqueKey': uniqueKey,
      'createAt': createAt.toIso8601String(),
    }));
  }
}
