import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class ReportChart extends GetView<ReportController> {
  const ReportChart({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: ''
    );
  
    return Obx(() =>
      Row(
        children: [
          SizedBox(
            width: 80,
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              reverse: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    height: 45,
                    child: Text(
                        currencyFormat.format((controller.data.max / 5 * index).toInt()),
                        style: TextStyle(
                          fontSize: 12,
                          color: color
                        ),
                    ),
                  ),
                );
              },
            )
          ),
          
          Expanded(
            child: SingleChildScrollView(
              key: const PageStorageKey<String>('report'),
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 270,
                width: controller.dateInMonth.value * 35,
                child: LineChart(
                  LineChartData(
                    maxX: controller.dateInMonth.value.toDouble() - 1,
                    minX: 0,
                    maxY: controller.data.reduce(max) + 1,
                    minY: 0,
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        // left: BorderSide(width: 1, color: color),
                        bottom: BorderSide(width: 1, color: color)
                      )
                    ),
                    lineTouchData: const LineTouchData(
                      enabled: true,
                    ),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 10,
                          interval: 1,
                        )
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 75,
                          interval: controller.data.reduce(max) / 5.0 > 0 ? controller.data.reduce(max) / 5 : 10,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(value.toInt().toString(), style: TextStyle(color: color)),
                            );
                          },
                        )
                      ),
                      rightTitles: AxisTitles(
                        drawBelowEverything: true,
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 50,
                          interval: controller.data.reduce(max) / 5 > 0 ? controller.data.reduce(max) / 5 : 10,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(value.toInt().toString(), style: TextStyle(color: color)),
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
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                '${value.toInt() + 1}',
                                style: TextStyle(
                                  color: color
                                ),
                              )
                            );
                          }

                        )
                      )
                    ),
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      verticalInterval: 1,
                      horizontalInterval: controller.data.reduce(max) / 5 > 0 ? controller.data.reduce(max) / 5 : 10,
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
            ),
          )
        ],
      ),
    );
  }
}