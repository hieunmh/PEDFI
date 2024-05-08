// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/home/time_line_month.dart';
import 'package:pedfi/pages/application/home/total_balance.dart';
import 'package:pedfi/pages/application/home/transaction.dart';

class HomePage extends GetView<HomeController>  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // final themeState = Provider.of<DarkThemeProvider>(context);

    // final Color color = themeState.getDarkTheme ? 
    // AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            children: [
              TimeLineMonth(),

              const TotalBalance(),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(184), child: Container(),
          ),
        ),
        // body: Column(
        //   children: [

        //     const SizedBox(height: 10),
            
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Column(
        //         children: [                                              
        //           const Transaction()
        //         ],
        //       ),
        //     ),
        //   ]
        // )
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red
                ),
              ),

              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}