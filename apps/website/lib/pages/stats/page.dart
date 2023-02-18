import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/stats/model.dart';
import 'package:website/widgets/containers/page_item.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({
    super.key,
  });

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<StatsModel>(
      model: getIt<StatsModel>(),
      child: ScopedModelDescendant<StatsModel>(builder: (context, child, model) {
        return PageItemWidget(
          child: Center(
            child: Column(
              children: [
                Text(
                  'List stats',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
