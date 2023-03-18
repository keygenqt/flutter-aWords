import 'package:flutter/material.dart';
import 'package:website/theme/radius.dart';

class Chart1Widget extends StatelessWidget {
  const Chart1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.medium,
      ),
      child: SizedBox(
        width: (1200 - 300 - 20) / 3 - 20,
        child: Image.asset(
          'images/charts.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
