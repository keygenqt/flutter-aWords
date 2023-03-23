import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/string_ext.dart';
import 'package:website/pages/cards/model.dart';
import 'package:website/pages/cards/widgets/item.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({
    super.key,
  });

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final model = getIt<CardsModel>();

  bool toggleUsersCard = false;
  bool toggleMyCard = false;
  bool toggleFavoriteCard = false;

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

    final textField = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.small,
      ),
      constraints: const BoxConstraints(
        maxWidth: 500,
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
                Visibility(
                  visible: width <= 400,
                  child: Column(
                    children: [
                      textField,
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      visible: width > 400,
                      child: Expanded(
                        flex: 8,
                        child: textField,
                      ),
                    ),
                    Visibility(
                      visible: width > 400,
                      child: const SizedBox(width: 10),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: AppRadius.small,
                        border: Border.all(
                          width: 1,
                          color: toggleUsersCard || toggleMyCard || toggleFavoriteCard
                              ? AppColors.primary
                              : AppColors.fontPrimary,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                      child: Row(
                        children: [
                          Material(
                            borderRadius: AppRadius.small,
                            color: toggleUsersCard ? AppColors.primary : AppColors.fontPrimary,
                            child: IconButton(
                              tooltip: localizations.cards_tooltip_users_cards,
                              icon: const Icon(Icons.group),
                              color: Colors.white,
                              disabledColor: AppColors.secondary,
                              onPressed: () => setState(() {
                                toggleUsersCard = !toggleUsersCard;
                                toggleMyCard = false;
                                toggleFavoriteCard = false;
                              }),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Material(
                            borderRadius: AppRadius.small,
                            color: toggleMyCard ? AppColors.primary : AppColors.fontPrimary,
                            child: IconButton(
                              tooltip: localizations.cards_tooltip_my_cards,
                              icon: const Icon(Icons.my_library_add),
                              color: Colors.white,
                              disabledColor: AppColors.secondary,
                              onPressed: () => setState(() {
                                toggleUsersCard = false;
                                toggleMyCard = !toggleMyCard;
                                toggleFavoriteCard = false;
                              }),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Material(
                            borderRadius: AppRadius.small,
                            color: toggleFavoriteCard ? AppColors.primary : AppColors.fontPrimary,
                            child: IconButton(
                              tooltip: localizations.cards_tooltip_favorite_cards,
                              icon: const Icon(Icons.favorite),
                              color: Colors.white,
                              disabledColor: AppColors.secondary,
                              onPressed: () => setState(() {
                                toggleUsersCard = false;
                                toggleMyCard = false;
                                toggleFavoriteCard = !toggleFavoriteCard;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: AppRadius.small,
                        border: Border.all(width: 1, color: AppColors.secondary),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                      child: Row(
                        children: [
                          Material(
                            borderRadius: AppRadius.small,
                            color: AppColors.secondary,
                            child: IconButton(
                              tooltip: localizations.cards_tooltip_create_card,
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              onPressed: () => debugPrint('Add card'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                          .map((entity) => CardItemWidget(
                                id: entity.id ?? 0,
                                image: entity.image.getFileUrl(),
                                name: entity.name,
                                desc: entity.desc,
                              ))
                          .toList(),
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
