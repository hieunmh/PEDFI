import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportChart extends GetView<ReportController> {
  const ReportChart({super.key});

  @override
  Widget build(BuildContext context) {

    final lineBarData = [
      LineChartBarData(
        isCurved: false,
        dotData: const FlDotData(show: true),
        spots: controller.pricePoint.map((p) => FlSpot(p.x, p.y)).toList()
      )
    ];

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
  
    return Obx(() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        height: 380,
        child: LineChart(
          LineChartData(
            maxX: 6,
            minX: 0,
            maxY: 20,
            minY: 0,
            borderData: FlBorderData(
              show: true,
              border: Border(
                left: BorderSide(width: 1, color: color),
                bottom: BorderSide(width: 1, color: color)
              )
            ),
            showingTooltipIndicators: controller.pricePoint.map(
              (element) {
                return ShowingTooltipIndicators([
                  LineBarSpot(
                    lineBarData[0], 
                    lineBarData.indexOf(lineBarData[0]), 
                    lineBarData[0].spots[element.x.toInt()]
                  )
                ]);
              }
            ).toList(),
            lineTouchData: const LineTouchData(
              enabled: true,
            ),
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
              leftTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 44,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: value.toInt() % 4 == 0  ? 
                      Text(value.toInt().toString(), style: TextStyle(color: color)) 
                      : const Text(''),
                    );
                  },
                )
              ),
              rightTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 44,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: value.toInt() % 4 == 0  ? 
                      Text(value.toInt().toString(), style: TextStyle(color: color)) 
                      : const Text(''),
                    );
                  },
                )
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    var style = TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: color
                    );

                    Widget text;
                    switch (value.toInt()) {
                      case 0:
                        text = Column(
                          children: [
                            Text('Mon', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(controller.startOfWeek.value), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 1:
                        text = Column(
                          children: [
                            Text('Tue', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 1
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 2:
                        text = Column(
                          children: [
                            Text('Wed', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 2
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 3:
                        text = Column(
                          children: [
                            Text('Thu', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 3
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 4:
                        text = Column(
                          children: [
                            Text('Fri', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 4
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 5:
                        text = Column(
                          children: [
                            Text('Sat', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 5
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      case 6:
                        text = Column(
                          children: [
                            Text('Sun', style: style), 
                            Obx(() =>
                              Text(
                                DateFormat('dd/MM').format(
                                  DateTime(
                                    controller.startOfWeek.value.year,
                                    controller.startOfWeek.value.month,
                                    controller.startOfWeek.value.day + 6
                                  )
                                ), 
                                style: style
                              ),
                            )
                          ]
                        );
                        break;
                      default:
                        text = Text('', style: style);
                        break;
                    }

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: text,
                    );
                  }
                 )
              )
            ),
            gridData: FlGridData(
              drawVerticalLine: false,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) => FlLine(
                color: color,
                strokeWidth: 0.5,
                dashArray: [4, 4]
              ),
              // horizontalInterval: 2
            ),
            lineBarsData:  [
              LineChartBarData(
                color: controller.reporttype.value == 'income' ? 
                AppColor.incomeDarkColor : AppColor.commonColor,
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
}