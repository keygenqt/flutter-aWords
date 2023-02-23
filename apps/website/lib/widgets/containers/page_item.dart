import 'package:flutter/material.dart';

class PageItemWidget extends StatelessWidget {
  const PageItemWidget({
    super.key,
    required this.child,
    this.color,
    this.maxWidth = 1200,
    this.padding = 30,
    this.alignment = Alignment.center,
  });

  final Color? color;
  final Widget child;
  final double maxWidth;
  final int padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        alignment: alignment,
        child: Container(
          color: color,
          width: MediaQuery.of(context).size.width >
              maxWidth + padding * 2
              ? maxWidth
              : MediaQuery.of(context).size.width - padding * 2,
          child: child,
        ),
      ),
    );
  }
}