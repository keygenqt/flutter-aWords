import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:website/routes/routes.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

class Error404Page extends StatefulWidget {
  const Error404Page({
    super.key,
  });

  @override
  State<Error404Page> createState() => _Error404PageState();
}

class _Error404PageState extends State<Error404Page> {
  @override
  Widget build(BuildContext context) {
    return PageItemWidget(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(
              'lottie/404_not_found.json',
              width: 260,
              fit: BoxFit.contain,
            ),
            Text(
              AppLocalizations.of(context)!.common_404_error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Material(
              color: AppColors.secondary,
              borderRadius: AppRadius.small,
              child: InkWell(
                borderRadius: AppRadius.small,
                onTap: () => {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.home,
                    (Route<dynamic> route) => false,
                  )
                },
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.common_404_error_btn,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
