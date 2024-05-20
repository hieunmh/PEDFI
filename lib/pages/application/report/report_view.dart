import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_chart.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:pedfi/pages/application/report/report_type.dart';
import 'package:pedfi/pages/application/report/report_week.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    // final Color color = themeState.getDarkTheme ? 
    // AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        toolbarHeight: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ReportType(),

            ReportWeek(),

            ReportChart()
          ],
        ),
      ),
    );
  }
}