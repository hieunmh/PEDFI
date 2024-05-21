import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_chart.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:pedfi/pages/application/report/report_ranking.dart';
import 'package:pedfi/pages/application/report/report_type.dart';
import 'package:pedfi/pages/application/report/report_week.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        toolbarHeight: 0,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Obx(() =>
          Column(
            children: [
              const ReportType(),

              const ReportWeek(),
          
              controller.rankingTransaction.isNotEmpty ? const Column(
                children: [
          
                  ReportChart(),
          
                  ReportRanking()
                ],
              ) : Container(
                height: 400,
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.faceFrown,
                        color: color,
                        size: 60,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'No transaction found',
                        style: TextStyle(
                          color: color,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}