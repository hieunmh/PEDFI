import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeTransaction extends GetView<HomeController> {
  const HomeTransaction({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final incomeColor = themeState.getDarkTheme ? AppColor.incomeDarkColor : AppColor.incomeLightColor;

    final expenseColor = themeState.getDarkTheme ? AppColor.expenseDarkColor : AppColor.expenseLightColor;

    final bgColor = themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100;

    final Color color = themeState.getDarkTheme ? AppColor.textDarkThemeColor : AppColor.textLightThemeColor;


    final List<Map<String, dynamic>> transactionsData = [
      {
        'icon': FontAwesomeIcons.burger,
        'iconcolor': expenseColor,
        'name': 'Food',
        'detail': 'Dookki',
        'totalAmount': '-\$45.00',
        'date': 'Today',
        'color': expenseColor
      },
      {
        'icon': FontAwesomeIcons.dollarSign,
        'iconcolor': incomeColor,
        'name': 'Work',
        'detail': 'Salary',
        'totalAmount': '+\$2000.00',
        'date': 'Today',
        'color': incomeColor
      },
      {
        'icon': FontAwesomeIcons.burger,
        'iconcolor': expenseColor,
        'name': 'Food',
        'detail': 'Dookki',
        'totalAmount': '-\$45.00',
        'date': 'Today',
        'color': expenseColor
      },
      {
        'icon': FontAwesomeIcons.dollarSign,
        'iconcolor': incomeColor,
        'name': 'Work',
        'detail': 'Salary',
        'totalAmount': '+\$2000.00',
        'date': 'Today',
        'color': incomeColor
      },
      {
        'icon':FontAwesomeIcons.heartCircleBolt,
        'iconcolor': expenseColor,
        'name': 'Health',
        'detail': 'Hospital',
        'totalAmount': '-\$79.00',
        'date': 'Yesterday',
        'color': expenseColor
      },
      {
        'icon': FontAwesomeIcons.planeUp,
        'iconcolor': expenseColor,
        'name': 'Travel',
        'detail': 'Hai Phong food tour',
        'totalAmount': '-\$350.00',
        'date': 'Yesterday',
        'color': expenseColor
      },
    ];
    

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: transactionsData.length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          transactionsData[index]['icon'],
                          color: color,
                          size: 20,
                        ),

                        const SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              transactionsData[index]['name'],
                              style: TextStyle(
                                fontSize: 14,
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Text(
                              transactionsData[index]['detail'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          transactionsData[index]['totalAmount'],
                          style: TextStyle(
                            fontSize: 14,
                            color: transactionsData[index]['color'],
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          transactionsData[index]['date'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        ),
      )
    );
  }
}