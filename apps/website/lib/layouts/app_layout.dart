import 'package:flutter/material.dart';
import 'package:website/widget/blocks/footer.dart';
import 'package:website/widget/blocks/header.dart';
import 'package:website/widget/containers/page.dart';
import 'package:website/widget/containers/page_item.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      spacing: 20,
      body: widget.page,
      header: const PageItemWidget(
        child: HeaderWidget(),
      ),
      footer: const PageItemWidget(
        child: FooterWidget(),
      ),
    );
  }
}
