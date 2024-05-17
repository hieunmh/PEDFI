import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/calendar/calendar_controller.dart';
import 'package:pedfi/pages/application/calendar/calendar_table.dart';
import 'package:pedfi/pages/application/calendar/calentdar_transaction.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

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
      body: const Column(
        children: [
          CalendarTable(),

          SizedBox(height: 10),

          CalendarTransaction(),
        ],
      ),
    );
  }
}