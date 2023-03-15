import 'package:dio/dio.dart';
import 'package:website/models/card.dart';

/// Http service API '/api/cards'
class CardsService {
  CardsService(this.dio);

  final Dio dio;

  /// Get all cards
  Future<List<CardModel>> getList() async {
    // query
    final response = await dio.request('/api/cards');
    // mapper
    return List<CardModel>.from(response.data.map((x) => CardModel.fromJson(x)));
  }

  /// Get user cards
  Future<List<CardModel>> getUserList({
    required userId,
  }) async {
    // query
    final response = await dio.request('/api/cards/$userId');
    // mapper
    return List<CardModel>.from(response.data.map((x) => CardModel.fromJson(x)));
  }
}
