import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/pages/cards/page.dart';

/// Model for [CardsPage]
class CardsModel extends Model {
  /// Get [ScopedModel]
  static CardsModel of(BuildContext context) => ScopedModel.of<CardsModel>(context);
}
