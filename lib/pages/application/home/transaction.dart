import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:provider/provider.dart';

class Transaction extends GetView<HomeController> {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final bgColor = themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100;

    final incomeColor = themeState.getDarkTheme ? AppColor.incomeDarkColor : AppColor.incomeLightColor;

    final expenseColor = themeState.getDarkTheme ? AppColor.expenseDarkColor : AppColor.expenseLightColor;

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


    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.TRANSACTION);
              },
              child: const Text(
                'View all',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                ),
              ),
            )
          ],
        ),

        const SizedBox(height: 10),

        ...List.generate(transactionsData.length, (index) => Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: themeState.getDarkTheme ? Colors.white10 : Colors.black12,
                  offset: Offset.zero,
                  blurRadius: 4,
                  spreadRadius: 2
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: transactionsData[index]['iconcolor'],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          Icon(
                            transactionsData[index]['icon'],
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                            
                      const SizedBox(width: 12),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      )
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
                ]
              ),
            ),
          ),
        )),
      ],
    );
  }
}