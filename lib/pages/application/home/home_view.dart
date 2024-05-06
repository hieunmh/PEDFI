import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/home/total_balance.dart';
import 'package:pedfi/pages/application/home/transaction.dart';
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
        toolbarHeight: 0,
        backgroundColor: bgcolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60, 
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/placeholder.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.grey, width: 0.2)
                    ),
                  ),
        
                  const SizedBox(width: 10),
        
                  Obx(() =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to pedfi!',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          controller.userEmail.value.isEmpty ? 
                          'Sign in' : controller.userEmail.value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: color
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
        
              const TotalBalance(),
        
              const SizedBox(height: 30),
              
              const Transaction()
            ],
          ),
        ),
      )
    );
  }

  
}