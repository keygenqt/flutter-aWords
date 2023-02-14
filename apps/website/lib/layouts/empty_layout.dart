import 'package:flutter/material.dart';
import 'package:website/utils/colors.dart';
import 'package:website/widget/blocks/footer.dart';
import 'package:website/widget/blocks/header.dart';
import 'package:website/widget/containers/page.dart';
import 'package:website/widget/containers/page_item.dart';

class EmptyLayout extends StatefulWidget {
  const EmptyLayout({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  State<EmptyLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<EmptyLayout> {
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      color: AppColors.backgroundEmptyLayoutColor,
      spacing: 20,
      body: widget.page,
    );
  }
}
