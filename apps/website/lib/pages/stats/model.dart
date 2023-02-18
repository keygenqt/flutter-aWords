import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/pages/stats/page.dart';

/// Model for [StatsPage]
class StatsModel extends Model {
  /// Get [ScopedModel]
  static StatsModel of(BuildContext context) => ScopedModel.of<StatsModel>(context);
}
