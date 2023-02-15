import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/theme/colors.dart';
import 'package:website/widgets/containers/page_item.dart';

import '../../theme/radius.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({
    super.key,
  });

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 20,
            bottom: 20,
          ),
          child: PageItemWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/logo_40.png',
                        height: 40,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        AppLocalizations.of(context)!.footer_desc,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          ClipOval(
                            child: Material(
                              color: AppColors.secondary,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.telegram,
                                  color: Colors.white,
                                ),
                                tooltip: 'Telegram',
                                onPressed: () {},
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipOval(
                            child: Material(
                              color: AppColors.secondary,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                tooltip: 'Email',
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).size.width > 1180,
                  child: Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, right: 30),
                      child: Image.asset(
                        'images/analysis.png',
                        height: 280,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: MediaQuery.of(context).size.width > 800,
                    child: Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .footer_title_features,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Icon(
                                    Icons.translate,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        borderRadius: AppRadius.small,
                                        onTap: () => {},
                                        child: ClipRRect(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7, horizontal: 10),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .footer_title_create_card,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: AppColors.primary),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .footer_create_card,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Icon(
                                    Icons.bar_chart,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        borderRadius: AppRadius.small,
                                        onTap: () => {},
                                        child: ClipRRect(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7, horizontal: 10),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .footer_title_stats_card,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: AppColors.primary),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .footer_stats_card,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Icon(
                                    Icons.group,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        borderRadius: AppRadius.small,
                                        onTap: () => {},
                                        child: ClipRRect(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 7,
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .footer_title_friends,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: AppColors.primary),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .footer_friends,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.backgroundLightSecondary,
          padding: const EdgeInsets.all(30),
          child: PageItemWidget(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    AppLocalizations.of(context)!
                        .copyright(DateTime.now().year),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
