import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';

class ChartCounterWidget extends StatefulWidget {
  const ChartCounterWidget({
    super.key,
    required this.count,
    required this.color,
    required this.text,
    required this.icon,
  });

  final int count;
  final Color color;
  final String text;
  final IconData icon;

  @override
  State<ChartCounterWidget> createState() => _ChartCounterWidgetState();
}

class _ChartCounterWidgetState extends State<ChartCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.medium,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundLightGray,
          borderRadius: AppRadius.small,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Icon(
                      widget.icon,
                      color: widget.color,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.count}",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.text,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: widget.color,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
