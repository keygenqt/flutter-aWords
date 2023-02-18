import 'package:flutter/material.dart';
import 'package:website/theme/radius.dart';

/// Alert form
class BoxAlert extends StatelessWidget {
  const BoxAlert({
    super.key,
    this.text,
    this.color = Colors.redAccent,
    required this.visible,
  });

  final bool visible;
  final Color color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppRadius.medium,
        ),
        child: Text(
          '$text',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
