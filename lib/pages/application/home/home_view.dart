// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/home/home_transaction.dart';
import 'package:pedfi/pages/application/home/time_line_month.dart';
import 'package:pedfi/pages/application/home/total_balance.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends GetView<HomeController>  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        toolbarHeight: 0,
      ),
      body: Column(
          children: [
            
            TimeLineMonth(),

            TotalBalance(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color:Colors.transparent
              ),
              child: Row(
                children: [
                  Text(
                    'Transaction',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),

            HomeTransaction()

          ],
        )
      
    );
  }
}