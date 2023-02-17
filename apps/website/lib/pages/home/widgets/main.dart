import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

import '../model.dart';

class HomeMainWidget extends StatelessWidget {
  const HomeMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
        child: PageItemWidget(
          child: Row(
            children: [
              Visibility(
                visible: MediaQuery.of(context).size.width > 800,
                child: Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.red,
                    child: Lottie.asset(
                      'lottie/home_main_robot.json',
                      height: 500,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: (MediaQuery.of(context).size.width < 800 ? 0 : 500),
                    minWidth: double.infinity,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.home_main_welcome.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.secondary),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context)!.home_main_title,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.primary,
                                fontSize: MediaQuery.of(context).size.width < 1180 ? 40 : 60,
                              ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          AppLocalizations.of(context)!.home_main_text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 30),
                        Material(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small,
                          child: InkWell(
                            borderRadius: AppRadius.small,
                            onTap: () => Navigator.of(context).pushNamed('/registration'),
                            child: ClipRRect(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 14,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.home_main_btn,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
