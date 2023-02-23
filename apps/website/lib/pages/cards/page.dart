import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/cards/model.dart';
import 'package:website/pages/cards/widgets/item.dart';
import 'package:website/widgets/containers/page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({
    super.key,
  });

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final model = getIt<CardsModel>();

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

    return ScopedModel<CardsModel>(
      model: model,
      child: ScopedModelDescendant<CardsModel>(builder: (context, child, model) {
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
                  localizations.cards_title,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  localizations.cards_subtitle,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: model.models!.isEmpty
                      ? [
                    Lottie.asset(
                      'lottie/empty.json',
                      width: 260,
                      fit: BoxFit.contain,
                    )
                  ]
                      : model.models!
                      .map((model) => CardItemWidget(
                    image: model.image,
                    name: model.name,
                    desc: model.desc,
                  ))
                      .toList(),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
