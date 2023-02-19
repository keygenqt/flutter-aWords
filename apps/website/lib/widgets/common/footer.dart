import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/app.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

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
                        AppLocalizations.of(context)!.common_footer_desc,
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
                                onPressed: () async {
                                  await launchUrl(Uri.parse('https://t.me/keygenqt'));
                                },
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
                                onPressed: () async {
                                  await launchUrl(Uri.parse('mailto:keygenqt@gmail.com'));
                                },
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
                              AppLocalizations.of(context)!.common_footer_title_features,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 20),
                            featureItem(
                              route: AppRoutes.cards,
                              icon: Icons.style,
                              title: AppLocalizations.of(context)!.common_footer_title_create_card,
                              text: AppLocalizations.of(context)!.common_footer_create_card,
                              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.cards,
                                ModalRoute.withName(AppRoutes.home),
                              ),
                            ),
                            const SizedBox(height: 10),
                            featureItem(
                              route: AppRoutes.stats,
                              icon: Icons.bar_chart,
                              title: AppLocalizations.of(context)!.common_footer_title_stats_card,
                              text: AppLocalizations.of(context)!.common_footer_stats_card,
                              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.stats,
                                ModalRoute.withName(AppRoutes.home),
                              ),
                            ),
                            const SizedBox(height: 10),
                            featureItem(
                              route: AppRoutes.friends,
                              icon: Icons.face_retouching_natural,
                              title: AppLocalizations.of(context)!.common_footer_title_friends,
                              text: AppLocalizations.of(context)!.common_footer_friends,
                              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.friends,
                                ModalRoute.withName(AppRoutes.home),
                              ),
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
                    AppLocalizations.of(context)!.common_copyright(DateTime.now().year),
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

  Widget featureItem({
    required String route,
    required IconData icon,
    required String title,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Icon(
            icon,
            color: ModalRoute.of(context)?.settings.name == route ? AppColors.secondary : Colors.blueGrey,
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
                onTap: ModalRoute.of(context)?.settings.name == route ? null : onTap,
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        )),
      ],
    );
  }
}
