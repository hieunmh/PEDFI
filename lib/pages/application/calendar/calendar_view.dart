import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/calendar/calendar_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

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
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: TableCalendar(
              focusedDay: DateTime.now(), 
              firstDay: DateTime(1000), 
              lastDay: DateTime(3000),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(color: Colors.blue.shade600, fontWeight: FontWeight.w700),
                todayTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                weekendTextStyle: const TextStyle(color: AppColor.commonColor, fontWeight: FontWeight.w700),
                outsideTextStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
                todayDecoration: const BoxDecoration(
                  color: AppColor.commonColor,
                  shape: BoxShape.circle
                ),
              ),
              onFormatChanged: (format) {
            
              },
            ),
          )
        ],
      ),
    );
  }
}