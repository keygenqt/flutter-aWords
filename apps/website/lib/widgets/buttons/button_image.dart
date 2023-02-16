import 'package:flutter/material.dart';
import 'package:website/theme/radius.dart';

class ButtonImageWidget extends StatelessWidget {
  const ButtonImageWidget({
    super.key,
    required this.image,
    this.onTap,
    this.color,
  });

  final Color? color;
  final Image image;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        borderRadius: AppRadius.small,
        onTap: onTap,
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 9),
            child: image,
          ),
        ),
      ),
    );
  }
}
