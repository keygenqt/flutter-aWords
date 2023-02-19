import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

class HomeApplicationsWidget extends StatelessWidget {
  const HomeApplicationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
        child: PageItemWidget(
          child: Row(
            children: [
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
                          AppLocalizations.of(context)!.home_apps_title1.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.secondary),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: AppColors.primary,
                                  fontSize: MediaQuery.of(context).size.width < 1180 ? 40 : 60,
                                ),
                            children: <TextSpan>[
                              TextSpan(text: AppLocalizations.of(context)!.home_apps_title2),
                              TextSpan(
                                text: ' a',
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                      color: AppColors.secondary,
                                      fontSize: MediaQuery.of(context).size.width < 1180 ? 40 : 60,
                                    ),
                              ),
                              const TextSpan(text: 'Words '),
                              TextSpan(
                                text: AppLocalizations.of(context)!.home_apps_title3,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          AppLocalizations.of(context)!.home_apps_text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Material(
                              color: Colors.white,
                              child: InkWell(
                                borderRadius:
                                    MediaQuery.of(context).size.width < 400 ? AppRadius.extraLarge : AppRadius.small,
                                onTap: () async {
                                  await launchUrl(Uri.parse('https://www.android.com/'));
                                },
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home_google.png',
                                    height: MediaQuery.of(context).size.width < 370 ? 38 : 45,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Material(
                              color: Colors.white,
                              child: InkWell(
                                borderRadius:
                                    MediaQuery.of(context).size.width < 400 ? AppRadius.extraLarge : AppRadius.small,
                                onTap: () async {
                                  await launchUrl(Uri.parse('https://auroraos.ru/'));
                                },
                                child: ClipRRect(
                                  child: Image.asset(
                                    'images/home_aurora.png',
                                    height: MediaQuery.of(context).size.width < 370 ? 38 : 45,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).size.width > 800,
                child: Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.red,
                    child: Image.asset(
                      'images/home_phones.png',
                      height: 400,
                      width: double.infinity,
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
