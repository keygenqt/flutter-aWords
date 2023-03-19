import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/string_ext.dart';
import 'package:website/pages/stats/model.dart';
import 'package:website/pages/stats/widgets/chartActivity.dart';
import 'package:website/pages/stats/widgets/chartCounter.dart';
import 'package:website/pages/stats/widgets/item.dart';
import 'package:website/widgets/containers/page_item.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({
    super.key,
  });

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final model = getIt<StatsModel>();

  @override
  void initState() {
    super.initState();
    model.getList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);
    final width = MediaQuery.of(context).size.width;

    return ScopedModel<StatsModel>(
      model: model,
      child: ScopedModelDescendant<StatsModel>(builder: (context, child, model) {
        if (model.loading || model.models == null) {
          return PageItemWidget(
            child: Center(
              child: Lottie.asset(
                'lottie/loading.json',
                width: 180,
                fit: BoxFit.contain,
              ),
            ),
          );
        } else {
          return PageItemWidget(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  localizations.stats_title,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  localizations.stats_subtitle,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      direction: Axis.vertical,
                      children: model.models!.isEmpty
                          ? [
                              Lottie.asset(
                                'lottie/empty.json',
                                width: 260,
                                fit: BoxFit.contain,
                              )
                            ]
                          : model.models!
                              .map(
                                (model) => CardItemWidget(
                                  image: model.image.getFileUrl(),
                                  name: model.name,
                                  desc: model.desc,
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 1200 - 300 - 20,
                      child: Wrap(
                        runSpacing: 20,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: (1200 - 300 - 20) / 3 - 20,
                                child: ChartCounterWidget(
                                  icon: Icons.motion_photos_auto,
                                  count: 100,
                                  color: Color(0xff1047c0),
                                  text: "Всего доступных слов для изучения",
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: (1200 - 300 - 20) / 3 - 20,
                                child: ChartCounterWidget(
                                  icon: Icons.av_timer,
                                  count: 12,
                                  color: Color(0xff64aee7),
                                  text: "Всего не выученных слов в карточке",
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: (1200 - 300 - 20) / 3 - 20,
                                child: ChartCounterWidget(
                                  icon: Icons.check_circle_outline,
                                  count: 99,
                                  color: Color(0xff00b3ad),
                                  text: "Всего выученных слов в карточке",
                                ),
                              ),
                            ],
                          ),

                          // Активность по месяцам
                          const SizedBox(
                            // height: 450,
                            width: 1200 - 300 - 20,
                            child: ChartActivity(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }
      }),
    );
  }
}
