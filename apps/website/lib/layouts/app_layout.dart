import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';
import 'package:website/widgets/common/footer.dart';
import 'package:website/widgets/common/header.dart';
import 'package:website/widgets/containers/page.dart';
import 'package:website/widgets/containers/page_item.dart';

enum AppLayoutType { white, gray }

class AppLayout extends StatefulWidget {
  const AppLayout({
    super.key,
    required this.page,
    required this.locale,
    this.type = AppLayoutType.white,
  });

  final AppLayoutType type;
  final Widget page;
  final Locale locale;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: widget.locale,
      child: Builder(
        builder: (context) {
          return PageWidget(
            color: widget.type == AppLayoutType.white
                ? AppColors.backgroundLight
                : AppColors.backgroundLightSecondary,
            spacing: 20,
            body: widget.page,
            header: PageItemWidget(
              child: HeaderWidget(
                  color: widget.type == AppLayoutType.white
                      ? AppColors.backgroundLightSecondary
                      : AppColors.backgroundLight),
            ),
            footer: const FooterWidget(),
          );
        },
      ),
    );
  }
}
