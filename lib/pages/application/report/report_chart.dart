import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportChart extends GetView<ReportController> {
  const ReportChart({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Obx(() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: 300,
        child: LineChart(
          LineChartData(
            maxX: 6,
            minX: 0,
            maxY: 20,
            minY: 0,
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                axisNameSize: 30,
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 10,
                  interval: 1,
                )
              ),
              bottomTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets
                 )
              )
            ),
            gridData: const FlGridData(
              drawVerticalLine: true
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: false,
                dotData: const FlDotData(show: true),
                spots: controller.pricePoint.map((p) => FlSpot(p.x, p.y)).toList()
              )
            ]
          )
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 1:
        text = const Text('Tue', style: style);
        break;
      case 2:
        text = const Text('Wed', style: style);
        break;
      case 3:
        text = const Text('Thu', style: style);
        break;
      case 4:
        text = const Text('Fri', style: style);
        break;
      case 5:
        text = const Text('Sat', style: style);
        break;
      case 6:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}