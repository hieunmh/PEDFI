import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/calendar/calendar_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends GetView<CalendarController> {
  const CalendarTable({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 0),
      child: Obx(() =>
        TableCalendar(
          focusedDay: controller.selectedDay.value, 
          firstDay: DateTime(1000), 
          lastDay: DateTime(3000),
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
            formatButtonTextStyle: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
            ),
            formatButtonDecoration: BoxDecoration(
              // color: AppColor.commonColor,
              border: Border.all(width: 2, color: color),
              borderRadius: BorderRadius.circular(5),
            )
          ),
          daysOfWeekHeight: 30,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: color,
              fontWeight: FontWeight.w700
            ),
            weekendStyle: TextStyle(
              color: color,
              fontWeight: FontWeight.w700
            )
          ),
          calendarStyle: CalendarStyle(
            cellMargin: const EdgeInsets.all(0),
            tableBorder: const TableBorder(
              horizontalInside: BorderSide(width: 0.5, color: Colors.grey),
              verticalInside: BorderSide(width: 0.5, color: Colors.grey),
              bottom: BorderSide(width: 0.5, color: Colors.grey),
              top: BorderSide(width: 0.5, color: Colors.grey),
              left: BorderSide(width: 0.5, color: Colors.grey),
            ),
            selectedDecoration: const BoxDecoration(
              color: AppColor.commonColor,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700
            ),
            outsideDaysVisible: true,
            defaultDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            defaultTextStyle: TextStyle(color: color, fontWeight: FontWeight.w700),
            todayTextStyle: const TextStyle(color: AppColor.commonColor, fontWeight: FontWeight.w900, fontSize: 16),
            weekendTextStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
            outsideTextStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
            todayDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          onDaySelected: (day, events) {
            controller.setSelectedDay(day);
          },
          selectedDayPredicate: (day) => isSameDay(day, controller.selectedDay.value),
          calendarFormat: controller.calendarFormat.value,
          onFormatChanged: (format) {
            controller.changedFormat(format);
          },
        ),
      ),
    );
  }
}