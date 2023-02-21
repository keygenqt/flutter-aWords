import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:website/extensions/map_ext.dart';

part 'card.g.dart';

/// Data class model
@JsonSerializable()
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

  final int? id;
  final int userId;
  final String image;
  final String name;
  final String desc;
  final DateTime updateAt;
  final DateTime createAt;

  /// Get model from map
  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  /// Get map from model
  Map<String, dynamic> toJson() => _$CardModelToJson(this);

  /// Get string json
  @override
  String toString() => const JsonEncoder().convert(toJson());

  /// copy
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
