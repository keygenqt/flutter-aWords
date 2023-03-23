import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'card.g.dart';

/// Data class model
@JsonSerializable()
class CardEntity {
  CardEntity({
    required this.id,
    required this.userId,
    required this.image,
    required this.name,
    required this.desc,
    required this.updateAt,
    required this.createAt,
  });

  final int? id;
  final int userId;
  final String image;
  final String name;
  final String desc;
  final DateTime updateAt;
  final DateTime createAt;

  /// Get model from map
  factory CardEntity.fromJson(Map<String, dynamic> json) => _$CardEntityFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$CardEntityToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());

  /// copy
  CardEntity copy([Map<String, dynamic>? json]) => CardEntity(
    id: json.asOrNull<int>('id') ?? id,
    userId: json.asOrNull<int>('userId') ?? userId,
    image: json.asOrNull<String>('image') ?? image,
    name: json.asOrNull<String>('name') ?? name,
    desc: json.asOrNull<String>('desc') ?? desc,
    updateAt: json.asOrNull<DateTime>('updateAt') ?? updateAt,
    createAt: json.asOrNull<DateTime>('createAt') ?? createAt,
  );
}
