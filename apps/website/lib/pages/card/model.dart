import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

/// Model for [CardPage]
class CardModel extends Model {
  /// Get [ScopedModel]
  static CardModel of(BuildContext context) => ScopedModel.of<CardModel>(context);
}
