import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:server_awords/exports/db/database.dart';

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
@json.JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel.create({
    required this.name,
    required this.email,
    required this.password,
  }) : id = null;

  final int? id;
  final String name;
  final String email;

  @json.JsonKey(includeToJson: false)
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

  UserModel clone({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? 0,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
