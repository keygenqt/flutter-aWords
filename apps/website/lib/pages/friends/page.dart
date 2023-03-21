import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/string_ext.dart';
import 'package:website/pages/friends/model.dart';
import 'package:website/pages/friends/widgets/item.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/common/chartActivity.dart';
import 'package:website/widgets/common/chartCounter.dart';
import 'package:website/widgets/containers/page_item.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({
    super.key,
  });

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final model = getIt<FriendsModel>();

  @override
  void initState() {
    super.initState();
    model.getList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;

    double cardBlockWidth = 300;
    double chartsBlockWidth = width - 60;

    if (width > 1260) {
      chartsBlockWidth = 1200 - 300 - 5;
    } else if (width > 1000) {
      chartsBlockWidth = width - 60 - 300 - 5;
    } else {
      cardBlockWidth = chartsBlockWidth;
    }

    final textField = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.small,
      ),
      constraints: BoxConstraints(
        maxWidth: cardBlockWidth - (width < 1000 ? 0 : 15),
      ),
      child: TextField(
        style: theme.textTheme.bodyMedium,
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.search),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.fontPrimary, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          labelText: localizations.cards_label_search,
        ),
        onChanged: (_) {},
      ),
    );

    return ScopedModel<FriendsModel>(
      model: model,
      child: ScopedModelDescendant<FriendsModel>(builder: (context, child, model) {
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
                  localizations.friends_title,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  localizations.friends_subtitle,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Wrap(
                  runSpacing: 10,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textField,
                        const SizedBox(height: 15),
                        SizedBox(
                          height: width < 1000
                              ? (94 * (model.models?.take(3).length ?? 0).toDouble()) - (model.models!.isEmpty ? 0 : 10)
                              : 560,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                              spacing: 15.5,
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
                                    (model) => SizedBox(
                                  width: cardBlockWidth,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: width < 1000 ? 0 : 16),
                                    child: CardItemWidget(
                                      image: model.image.getFileUrl(),
                                      name: model.name,
                                      desc: model.desc,
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      width: chartsBlockWidth,
                      child: Wrap(
                        runSpacing: 20,
                        children: [
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              SizedBox(
                                width: width > 1135 ? chartsBlockWidth / 3 - 20 : chartsBlockWidth,
                                child: ChartCounterWidget(
                                  icon: Icons.motion_photos_auto,
                                  count: 100,
                                  color: AppColors.primary,
                                  text: localizations.friends_chart_count_1,
                                ),
                              ),
                              SizedBox(
                                width: width > 1135 ? chartsBlockWidth / 3 - 20 : chartsBlockWidth,
                                child: ChartCounterWidget(
                                  icon: Icons.av_timer,
                                  count: 12,
                                  color: AppColors.primaryLight,
                                  text: localizations.friends_chart_count_2,
                                ),
                              ),
                              SizedBox(
                                width: width > 1135 ? chartsBlockWidth / 3 : chartsBlockWidth,
                                child: ChartCounterWidget(
                                  icon: Icons.check_circle_outline,
                                  count: 99,
                                  color: AppColors.secondary,
                                  text: localizations.friends_chart_count_3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: chartsBlockWidth,
                            child: const ChartActivity(),
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
