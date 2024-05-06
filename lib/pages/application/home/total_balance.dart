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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  '\$1234.56',
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  )
                ),
                Text(
                  'Total balance',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  )
                )
              ],
            ),
          ),
          
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: themeState.getDarkTheme ? 
                    Colors.blue.shade800 : Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        Column(
                          children: [
                            Text(
                              'Incoming',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              '+\$2600.10',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      Icon(FontAwesomeIcons.arrowTrendUp, color: Colors.white, size: 20)
                    ],
                  ),
                ),
              ),
          
              const SizedBox(width: 10),
          
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: themeState.getDarkTheme ? 
                    Colors.red.shade800 : Colors.red.shade400,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Expense',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            '-\$1000.25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                      Icon(FontAwesomeIcons.arrowTrendDown, color: Colors.white, size: 20)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}