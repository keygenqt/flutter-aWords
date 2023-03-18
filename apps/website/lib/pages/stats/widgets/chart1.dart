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
      child: Image.asset(
        'images/fl_chart.gif',
        fit: BoxFit.cover,
      ),
    );
  }
}
