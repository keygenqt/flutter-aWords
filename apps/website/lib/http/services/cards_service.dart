import 'package:dio/dio.dart';
import 'package:website/entities/card.dart';

/// Http service API '/api/cards'
class CardsService {
  CardsService(this.dio);

  final Dio dio;

  /// Get all cards
  Future<List<CardEntity>> getList() async {
    // query
    final response = await dio.request('/api/cards');
    // mapper
    return List<CardEntity>.from(response.data.map((x) => CardEntity.fromJson(x)));
  }

  /// Get user cards
  Future<List<CardEntity>> getUserList({
    required userId,
  }) async {
    // query
    final response = await dio.request('/api/cards/$userId');
    // mapper
    return List<CardEntity>.from(response.data.map((x) => CardEntity.fromJson(x)));
  }
}
