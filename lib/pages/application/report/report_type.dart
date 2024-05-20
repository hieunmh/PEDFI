import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportType extends GetView<ReportController> {
  const ReportType({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Obx(() =>
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.reporttype.value = 'income';
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: themeState.getDarkTheme ? 
                          controller.reporttype.value == 'income' ? 
                          AppColor.bgDarkThemeColor : Colors.grey.shade900 
                          : controller.reporttype.value == 'income' ? 
                          Colors.white : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.reporttype.value == 'income' ?
                            AppColor.incomeDarkColor : Colors.transparent,
                            width: 2.5
                          )
                          // border: BoxBorder()
                        ),
                        child: Center(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              color: controller.reporttype.value == 'income' ? 
                              AppColor.incomeDarkColor : color,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              
                  const SizedBox(width: 10),
              
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.reporttype.value = 'expense';
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: themeState.getDarkTheme ? 
                          controller.reporttype.value == 'expense' ? 
                          AppColor.bgDarkThemeColor : Colors.grey.shade900 
                          : controller.reporttype.value == 'expense' ? 
                          Colors.white : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.reporttype.value == 'expense' ? 
                            AppColor.expenseDarkColor :Colors.transparent,
                            width: 2.5
                          )
                        ),
                        child: Center(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                              color: controller.reporttype.value == 'expense'
                              ? AppColor.expenseDarkColor : color,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  
}