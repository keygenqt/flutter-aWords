import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/services/cards_service.dart';
import 'package:website/models/card.dart';
import 'package:website/pages/friends/page.dart';

/// Model for [FriendsPage]
class FriendsModel extends Model {
  /// Get [ScopedModel]
  static FriendsModel of(BuildContext context) => ScopedModel.of<FriendsModel>(context);

  /// Get service users
  final CardsService service = getIt<CardsService>();

  /// Error response
  bool _loading = false;

  bool get loading => _loading;

  /// Error response
  String? _error;

  String? get error => _error;

  /// Users response
  List<CardModel>? _models;

  List<CardModel>? get models => _models;

  /// Get users
  Future<void> getList() async {
    _loading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 2));
      _models = await service.getUserList(
          userId: 1
      );
    } catch (e) {
      _error = e.getMessage();
    }
    _loading = false;
    notifyListeners();
  }
}
