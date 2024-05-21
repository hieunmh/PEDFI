import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportWeek extends GetView<ReportController> {
  const ReportWeek({super.key});
  

  @override
  Widget build(BuildContext context) {


    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.setPreviousMonth();
                if (controller.reporttype.value == 'income') {
                  controller.setIncomeTransactionByDay(controller.firstDay.value);
                } else {
                  controller.setExpenseTransactionByDay(controller.firstDay.value);
                }
              },
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: color,
                size: 18,
              ),
            ),
            
            Obx(() =>
              GestureDetector(
                onTap: () {
                  controller.showDateTimePicker(context, color);
                },
                child: Text(
                  DateFormat('MMMM yyyy').format(controller.firstDay.value).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: color
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                controller.setNextMonth();
                if (controller.reporttype.value == 'income') {
                  controller.setIncomeTransactionByDay(controller.firstDay.value);
                } else {
                  controller.setExpenseTransactionByDay(controller.firstDay.value);
                }
              },
              child: Icon(
                FontAwesomeIcons.chevronRight,
                color: color,
                size: 18,
              ),
            ),
          ]
        ),
    );
  }
}