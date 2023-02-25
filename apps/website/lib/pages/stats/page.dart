import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
                Lottie.asset(
                  'lottie/empty.json',
                  width: 260,
                  fit: BoxFit.contain,
                ),

                // Всего выученных слов
                // Всего не выученных слов
                // Всего слов

                // Активность по месяцам

                // Активность по дням недели
                // Удача/не удача
                // Языки
              ],
            ),
          ),
        );
      }),
    );
  }
}
