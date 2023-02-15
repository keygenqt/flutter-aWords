import 'package:flutter/material.dart';

class BoxShadowWidget extends StatelessWidget {
  const BoxShadowWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 3,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
