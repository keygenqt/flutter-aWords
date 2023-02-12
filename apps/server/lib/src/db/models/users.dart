import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;
import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/other/extensions.dart';

part 'users.g.dart';

/// Table 'users' drift
@UseRowClass(UserModel)
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get password => text()();
}

/// Model app table 'users'
@json_annotation.JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // check json
    validateUser(json);
    // pass to md5
    json['password'] = json['password'].toString().asMD5();
    // create class
    return _$UserModelFromJson(json);
  }

  UserModel.create({
    required this.name,
    required this.email,
    required this.password,
  }) : id = null;

  final int? id;
  final String name;
  final String email;

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
      );
    } else {
      return UsersCompanion(
        id: Value(id ?? 0),
        name: Value(name),
        email: Value(email),
        password: Value(password),
      );
    }
  }

  UserModel clone(Map<String, dynamic> json) {
    // check json
    validateUser(json, update: true);
    // create new class
    return UserModel(
      id: id ?? 0,
      name: json['name']?.toString() ?? name,
      email: json['email']?.toString() ?? email,
      password: json['password']?.toString().asMD5() ?? password,
    );
  }
}
