import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';

part 'tokens.g.dart';

/// Table 'tokens' drift
@UseRowClass(TokenModel)
class Tokens extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  TextColumn get token => text()();

  TextColumn get uniqueKey => text()();

  DateTimeColumn get createAt => dateTime()();
}

/// Model app table 'tokens'
@json_annotation.JsonSerializable()
class TokenModel {
  TokenModel({
    required this.id,
    required this.userId,
    required this.token,
    required this.uniqueKey,
    required this.createAt,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  TokenModel.create({
    required this.userId,
    required this.token,
    required this.uniqueKey,
    required this.createAt,
  }) : id = null;

  @json_annotation.JsonKey(includeToJson: false)
  final int? id;
  final int userId;
  final String token;
  final String uniqueKey;
  final DateTime createAt;

  bool get isNew => id == null;

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  String toString() => toJson().toString();

  TokensCompanion toCompanion() {
    if (isNew) {
      return TokensCompanion.insert(
        userId: userId,
        token: token,
        uniqueKey: uniqueKey,
        createAt: createAt,
      );
    } else {
      return TokensCompanion(
        id: Value(id ?? 0),
        userId: Value(userId),
        token: Value(token),
        uniqueKey: Value(uniqueKey),
        createAt: Value(createAt),
      );
    }
  }

  TokenModel copy([Map<String, dynamic>? json]) => TokenModel(
        id: json.asOrNull<int>('id') ?? id,
        userId: json.asOrNull<int>('userId') ?? userId,
        token: json.asOrNull<String>('token') ?? token,
        uniqueKey: json.asOrNull<String>('uniqueKey') ?? uniqueKey,
        createAt: json.asOrNull<DateTime>('createAt') ?? createAt,
      );
}
