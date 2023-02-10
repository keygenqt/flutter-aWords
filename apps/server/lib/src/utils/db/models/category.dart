import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:server_awords/src/utils/db/base/database.dart';

part 'category.g.dart';

@UseRowClass(CategoryModel)
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().nullable()();

  TextColumn get description => text()();
}

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.id,
    this.title,
    required this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryModel.create({
    this.title,
    required this.description,
  }) : id = null;

  final int? id;
  final String? title;
  final String description;

  bool get isNew => id == null;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() => toJson().toString();

  CategoriesCompanion toCompanion() {
    if (isNew) {
      return CategoriesCompanion.insert(
        title: Value(title),
        description: description,
      );
    } else {
      return CategoriesCompanion(
        id: Value(id ?? 0),
        title: Value(title),
        description: Value(description),
      );
    }
  }

  CategoryModel clone({
    String? title,
    String? description,
  }) {
    return CategoryModel(
      id: id ?? 0,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
