import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TotalBalance extends GetView<HomeController> {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    
    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    final currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: '',
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: themeState.getDarkTheme ? Colors.black12 : Colors.grey.shade100
      ),
      
      child: Obx(() =>
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.firstDay.value,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600
                  ),
                ),
        
                Text(
                  ' - ',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600
                  ),
                ),
        
                Text(
                  controller.lastDay.value,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
        
            // Center(
            //   child: Column(
            //     children: [
            //       Text(
            //         'Total balance',
            //         style: TextStyle(
            //           color: Colors.grey.shade500,
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600
            //         )
            //       ),
            //       Text(
            //         currencyFormat.format(controller.incomeMonthValue() + controller.expenseMonthValue()),
            //         style: TextStyle(
            //           color: color,
            //           fontSize: 24,
            //           fontWeight: FontWeight.w800
            //         )
            //       ),
            //     ],
            //   ),
            // ),
            
            const SizedBox(height: 10),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(
                            FontAwesomeIcons.arrowDown, 
                            color: themeState.getDarkTheme ? 
                            AppColor.incomeDarkColor : AppColor.incomeLightColor, 
                            size: 12
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                              color: themeState.getDarkTheme ? 
                              AppColor.incomeDarkColor : AppColor.incomeLightColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),

                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.dongSign, 
                            color: themeState.getDarkTheme ? 
                            AppColor.incomeDarkColor : AppColor.incomeLightColor, 
                            size: 12
                          ),
                          Text(
                            currencyFormat.format(controller.incomeMonthValue()),
                            style: TextStyle(
                              color: themeState.getDarkTheme ? 
                              AppColor.incomeDarkColor : AppColor.incomeLightColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                      
                    ],
                  ),
                ),
            
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.arrowUp, 
                            color: themeState.getDarkTheme ? 
                            AppColor.expenseDarkColor : AppColor.expenseLightColor, 
                            size: 12
                          ),
                          Text(
                            'Expense',
                            style: TextStyle(
                              color: themeState.getDarkTheme ? 
                              AppColor.expenseDarkColor : AppColor.expenseLightColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.dongSign,
                            color: themeState.getDarkTheme ? 
                              AppColor.expenseDarkColor : AppColor.expenseLightColor,
                            size: 12,
                          ),
                          Text(
                            currencyFormat.format(controller.expenseMonthValue().abs()), 
                            style: TextStyle(
                              color: themeState.getDarkTheme ? 
                              AppColor.expenseDarkColor : AppColor.expenseLightColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                              fontSize: 12
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.dongSign,
                            color: color,
                            size: 12,
                          ),
                          Text(
                            currencyFormat.format(controller.incomeMonthValue() + controller.expenseMonthValue()), 
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}