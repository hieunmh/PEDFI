import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Transaction extends GetView<HomeController> {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final bgColor = themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100;



    final List<Map<String, dynamic>> transactionsData = [
    {
      'icon': FontAwesomeIcons.burger,
      'color': Colors.yellow[700],
      'name': 'Food',
      'totalAmount': '-\$45.00',
      'date': 'Today',
    },
    {
      'icon': FontAwesomeIcons.bagShopping,
      'color': Colors.purple,
      'name': 'Shopping',
      'totalAmount': '-\$230.00',
      'date': 'Today',
    },
    {
      'icon':FontAwesomeIcons.heartCircleBolt,
      'color': Colors.green,
      'name': 'Health',
      'totalAmount': '-\$79.00',
      'date': 'Yesterday',
    },
    {
      'icon': FontAwesomeIcons.planeUp,
      'color': Colors.blue,
      'name': 'Travel',
      'totalAmount': '-\$350.00',
      'date': 'Yesterday',
    }
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

            const Text(
              'View all',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15
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
              borderRadius: BorderRadius.circular(12),
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
                              color: transactionsData[index]['color'],
                              shape: BoxShape.circle
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
                      
                      Text(
                        transactionsData[index]['name'],
                        style: TextStyle(
                          fontSize: 14,
                          color: color,
                          fontWeight: FontWeight.w500
                        ),
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
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        transactionsData[index]['date'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.outline,
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