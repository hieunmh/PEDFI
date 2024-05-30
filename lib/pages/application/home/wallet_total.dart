import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class WalletTotal extends GetView<HomeController> {
  const WalletTotal({super.key});

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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeState.getDarkTheme ? Colors.black12 : Colors.grey.shade100,
      ),
      
      child: Obx(() =>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                        currencyFormat.format(controller.incomeAllValue()),
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
                        currencyFormat.format(controller.expenseAllValue().abs()), 
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
                        currencyFormat.format(controller.incomeAllValue() + controller.expenseAllValue()), 
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
        ),
      ),
    );
  }
}