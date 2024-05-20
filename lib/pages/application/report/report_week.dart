import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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

    return Obx(() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.setPreviousWeek();
                if (controller.reporttype.value == 'income') {
                  controller.setIncomeCategoryByDay(controller.startOfWeek.value);
                } else {
                  controller.setExpenseCategoryByDay(controller.startOfWeek.value);
                }
              },
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: color,
                size: 18,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd/MM').format(controller.startOfWeek.value).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: color
                  ),
                ),
                  
                Text(
                  ' - ',
                  style: TextStyle(
                    color: color,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                  
                Text(
                  DateFormat('dd/MM').format(controller.endOfWeek.value).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: color
                  ),
                )
              ],
            ),

            GestureDetector(
              onTap: () {
                controller.setNextWeek();
                if (controller.reporttype.value == 'income') {
                  controller.setIncomeCategoryByDay(controller.startOfWeek.value);
                } else {
                  controller.setExpenseCategoryByDay(controller.startOfWeek.value);
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
      ),
    );
  }
}