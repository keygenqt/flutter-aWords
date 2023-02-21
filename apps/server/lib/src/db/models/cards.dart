import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart' as json_annotation;
import 'package:server_awords/exports/db/database.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';

part 'cards.g.dart';

/// Table 'cards' drift
@UseRowClass(CardModel)
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  TextColumn get image => text()();

  TextColumn get name => text()();

  TextColumn get desc => text()();

  DateTimeColumn get updateAt => dateTime()();

  DateTimeColumn get createAt => dateTime()();
}

/// Model app table 'cards'
@json_annotation.JsonSerializable()
class CardModel {
  CardModel({
    required this.id,
    required this.userId,
    required this.image,
    required this.name,
    required this.desc,
    required this.updateAt,
    required this.createAt,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return _$CardModelFromJson(json);
  }

  CardModel.create({
    required this.userId,
    required this.image,
    required this.name,
    required this.desc,
    required this.updateAt,
    required this.createAt,
  }) : id = null;

  final int? id;
  final int userId;
  final String image;
  final String name;
  final String desc;
  final DateTime updateAt;
  final DateTime createAt;

  bool get isNew => id == null;

  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  @override
  String toString() => toJson().toString();

  CardsCompanion toCompanion() {
    if (isNew) {
      return CardsCompanion.insert(
        userId: userId,
        image: image,
        name: name,
        desc: desc,
        updateAt: updateAt,
        createAt: createAt,
      );
    } else {
      return CardsCompanion(
        id: Value(id ?? 0),
        userId: Value(userId),
        image: Value(image),
        name: Value(name),
        desc: Value(desc),
        updateAt: Value(updateAt),
        createAt: Value(createAt),
      );
    }
  }

  CardModel copy([Map<String, dynamic>? json]) => CardModel(
        id: json.asOrNull<int>('id') ?? id,
        userId: json.asOrNull<int>('userId') ?? userId,
        image: json.asOrNull<String>('image') ?? image,
        name: json.asOrNull<String>('name') ?? name,
        desc: json.asOrNull<String>('desc') ?? desc,
        updateAt: json.asOrNull<DateTime>('updateAt') ?? updateAt,
        createAt: json.asOrNull<DateTime>('createAt') ?? createAt,
      );
}
