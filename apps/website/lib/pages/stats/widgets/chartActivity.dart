import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';

import '../../../theme/radius.dart';

class ChartActivity extends StatefulWidget {
  const ChartActivity({
    super.key,
  });

  @override
  State<ChartActivity> createState() => _ChartActivityState();
}

class _ChartActivityState extends State<ChartActivity> {
  final Color gradientColor1 = AppColors.primary;
  final Color gradientColor2 = AppColors.primaryLight;
  final Color gradientColor3 = AppColors.secondary;
  final Color indicatorStrokeColor = Colors.black;

  final List<int> showIndexes = [];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 1),
        FlSpot(1, 2),
        FlSpot(2, 1.5),
        FlSpot(3, 3),
        FlSpot(4, 3.5),
        FlSpot(5, 5),
        FlSpot(6, 8),
        FlSpot(7, 5),
        FlSpot(8, 7),
        FlSpot(9, 8),
        FlSpot(10, 6),
        FlSpot(11, 4),
      ];

  Widget getMonth(String name, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        showIndexes.add(index);
      }),
      onExit: (_) => setState(() {
        showIndexes.clear();
      }),
      child: Text(
        name,
        style: TextStyle(color: showIndexes.contains(index) ? AppColors.primary : AppColors.fontPrimary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showIndexes,
        spots: allSpots,
        isCurved: true,
        barWidth: 4,
        shadow: const Shadow(blurRadius: 8),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.grey,
          gradient: LinearGradient(
            colors: [
              gradientColor1.withOpacity(0.4),
              gradientColor2.withOpacity(0.4),
              gradientColor3.withOpacity(0.4),
            ],
          ),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: [
            gradientColor1,
            gradientColor2,
            gradientColor3,
          ],
          stops: const [0.1, 0.4, 0.9],
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Container(
        padding: const EdgeInsets.only(top: 15, left: 13, right: 13, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activity in 2023",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Activity on the passage of the card by month this year. The number of responses is displayed",
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightGray,
                  borderRadius: AppRadius.medium,
                ),
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return LineChart(
                        LineChartData(
                          showingTooltipIndicators: showIndexes.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: false,
                            getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: AppColors.primary,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                                      radius: 8,
                                      color: lerpGradient(
                                        barData.gradient!.colors,
                                        barData.gradient!.stops!,
                                        percent / 100,
                                      ),
                                      strokeWidth: 2,
                                      strokeColor: indicatorStrokeColor,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: AppColors.primary,
                              tooltipRoundedRadius: 8,
                              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    lineBarSpot.y.toString(),
                                    const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              axisNameSize: 0,
                            ),
                            leftTitles: AxisTitles(axisNameSize: 0),
                            rightTitles: AxisTitles(axisNameSize: 0),
                            topTitles: AxisTitles(axisNameSize: 0),
                          ),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  getMonth('Jun', 0),
                  Spacer(),
                  getMonth('Feb', 1),
                  Spacer(),
                  getMonth('Mar', 2),
                  Spacer(),
                  getMonth('Apr', 3),
                  Spacer(),
                  getMonth('May', 4),
                  Spacer(),
                  getMonth('Jun', 5),
                  Spacer(),
                  getMonth('Jul', 6),
                  Spacer(),
                  getMonth('Aug', 7),
                  Spacer(),
                  getMonth('Sep', 8),
                  Spacer(),
                  getMonth('Oct', 9),
                  Spacer(),
                  getMonth('Nov', 10),
                  Spacer(),
                  getMonth('Dec', 11),
                ],
              ),
            ),
          ],
        ));
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (colors.isEmpty) {
    throw ArgumentError('"colors" is empty.');
  } else if (colors.length == 1) {
    return colors[0];
  }

  if (stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / (colors.length - 1);
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s];
    final rightStop = stops[s + 1];
    final leftColor = colors[s];
    final rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT)!;
    }
  }
  return colors.last;
}
