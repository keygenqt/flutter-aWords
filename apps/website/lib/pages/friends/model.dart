import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/pages/friends/page.dart';

/// Model for [FriendsPage]
class FriendsModel extends Model {
  /// Get [ScopedModel]
  static FriendsModel of(BuildContext context) => ScopedModel.of<FriendsModel>(context);
}
