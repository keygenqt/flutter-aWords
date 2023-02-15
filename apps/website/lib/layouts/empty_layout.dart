import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';
import 'package:website/widgets/containers/page.dart';

class EmptyLayout extends StatefulWidget {
  const EmptyLayout({
    super.key,
    required this.page,
    required this.locale,
  });

  final Widget page;
  final Locale locale;

  @override
  State<EmptyLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<EmptyLayout> {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('en'),
      child: Builder(
        builder: (context) {
          return PageWidget(
            color: AppColors.backgroundLightSecondary,
            spacing: 20,
            body: widget.page,
          );
        },
      ),
    );
  }
}
