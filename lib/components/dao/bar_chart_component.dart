import 'dart:math';

import 'package:asyou_app/router.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../store/theme.dart';
import '../../utils/responsive.dart';

class BarChartComponent extends StatelessWidget {
  const BarChartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        // axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
        gridData: FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: getTitles,
            ),
          ), // SideTitles
        ),
        barGroups: List.generate(
          12,
          (index) => barGroup(index, 50, context),
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 200),
      swapAnimationCurve: Curves.linear,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    final style = TextStyle(
      color: constTheme.centerChannelColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  BarChartGroupData barGroup(int x, double value, BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Colors.black,
          width: Responsive.isDesktop(context) ? 40 : 14,
          backDrawRodData: BackgroundBarChartRodData(
            toY: 90,
            show: true,
            color: constTheme.centerChannelColor.withOpacity(0.08),
          ),
        ),
      ],
    );
  }
}
