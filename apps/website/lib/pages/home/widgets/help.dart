import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

class HomeHelpWidget extends StatelessWidget {
  const HomeHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightSecondary,
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 80, left: 30, right: 30),
        child: PageItemWidget(
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.home_help_title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 30),
              Text(
                AppLocalizations.of(context)!.home_help_text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Lottie.asset(
                'lottie/email.json',
                width: 200,
                fit: BoxFit.contain,
              ),
              Material(
                color: AppColors.secondary,
                borderRadius: AppRadius.small,
                child: InkWell(
                  borderRadius: AppRadius.small,
                  onTap: () async {
                    await launchUrl(Uri.parse('mailto:keygenqt@gmail.com'));
                  },
                  child: ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.home_help_btn,
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
    );
  }
}
