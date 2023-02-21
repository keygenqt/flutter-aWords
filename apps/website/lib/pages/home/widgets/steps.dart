import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';
import 'package:website/widgets/containers/page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeStepsWidget extends StatelessWidget {
  const HomeStepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightGray,
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 80, left: 30, right: 30),
        child: PageItemWidget(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.home_steps_title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                      // fontSize: MediaQuery.of(context).size.width < 1180 ? 40 : 60,
                    ),
              ),
              const SizedBox(height: 30),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Text(
                  AppLocalizations.of(context)!.home_steps_text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: MediaQuery.of(context).size.width > 800,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_1.png',
                        index: 1,
                        title: AppLocalizations.of(context)!.home_steps_item1_title,
                        text: AppLocalizations.of(context)!.home_steps_item1_text,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_2.png',
                        index: 2,
                        title: AppLocalizations.of(context)!.home_steps_item2_title,
                        text: AppLocalizations.of(context)!.home_steps_item2_text,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_3.png',
                        index: 3,
                        title: AppLocalizations.of(context)!.home_steps_item3_title,
                        text: AppLocalizations.of(context)!.home_steps_item3_text,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_4.png',
                        index: 4,
                        title: AppLocalizations.of(context)!.home_steps_item4_title,
                        text: AppLocalizations.of(context)!.home_steps_item4_text,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: MediaQuery.of(context).size.width < 800 && MediaQuery.of(context).size.width > 400,
                  child: Wrap(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_1.png',
                              index: 1,
                              title: AppLocalizations.of(context)!.home_steps_item1_title,
                              text: AppLocalizations.of(context)!.home_steps_item1_text,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_2.png',
                              index: 2,
                              title: AppLocalizations.of(context)!.home_steps_item2_title,
                              text: AppLocalizations.of(context)!.home_steps_item2_text,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_3.png',
                              index: 3,
                              title: AppLocalizations.of(context)!.home_steps_item3_title,
                              text: AppLocalizations.of(context)!.home_steps_item3_text,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_4.png',
                              index: 4,
                              title: AppLocalizations.of(context)!.home_steps_item4_title,
                              text: AppLocalizations.of(context)!.home_steps_item4_text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Visibility(
                visible: MediaQuery.of(context).size.width < 400,
                child: Column(
                  children: [
                    _item(
                      context: context,
                      asset: 'images/home_steps_1.png',
                      index: 1,
                      title: AppLocalizations.of(context)!.home_steps_item1_title,
                      text: AppLocalizations.of(context)!.home_steps_item1_text,
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_2.png',
                      index: 2,
                      title: AppLocalizations.of(context)!.home_steps_item2_title,
                      text: AppLocalizations.of(context)!.home_steps_item2_text,
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_3.png',
                      index: 3,
                      title: AppLocalizations.of(context)!.home_steps_item3_title,
                      text: AppLocalizations.of(context)!.home_steps_item3_text,
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_4.png',
                      index: 4,
                      title: AppLocalizations.of(context)!.home_steps_item4_title,
                      text: AppLocalizations.of(context)!.home_steps_item4_text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    required BuildContext context,
    required asset,
    required index,
    required title,
    required text,
  }) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            asset,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Container(
              color: AppColors.secondary,
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
