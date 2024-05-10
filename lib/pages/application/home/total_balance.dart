import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: themeState.getDarkTheme ? Colors.black26 : Colors.grey.shade200
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

            const SizedBox(height: 10),
        
            Center(
              child: Column(
                children: [
                  Text(
                    'Total balance',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  Text(
                    '\$1234.56',
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                    )
                  ),
                ],
              ),
            ),
            
            // const SizedBox(height: 10),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Incoming',
                              style: TextStyle(
                                color: themeState.getDarkTheme ? 
                                AppColor.incomeDarkColor : AppColor.incomeLightColor,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '+\$2600.10',
                              style: TextStyle(
                                color: themeState.getDarkTheme ? 
                                AppColor.incomeDarkColor : AppColor.incomeLightColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          FontAwesomeIcons.arrowTrendUp, 
                          color: themeState.getDarkTheme ? 
                          AppColor.incomeDarkColor : AppColor.incomeLightColor, 
                          size: 20
                        )
                      ],
                    ),
                  ),
                ),
            
                const SizedBox(width: 10),
            
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Expense',
                              style: TextStyle(
                                color: themeState.getDarkTheme ? 
                                AppColor.expenseDarkColor : AppColor.expenseLightColor,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '-\$1000.25',
                              style: TextStyle(
                                color: themeState.getDarkTheme ? 
                                AppColor.expenseDarkColor : AppColor.expenseLightColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          FontAwesomeIcons.arrowTrendDown, 
                          color: themeState.getDarkTheme ? 
                          AppColor.expenseDarkColor : AppColor.expenseLightColor, 
                          size: 20
                        )
                      ],
                    ),
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