import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/transaction/time_line_month.dart';
import 'package:pedfi/pages/transaction/transaction_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:provider/provider.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          backgroundColor: bgcolor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            }, 
            icon: const MyBackButton()
          ),
          leadingWidth: 80,
          centerTitle: true,
          title: Text(
            'All transaction',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 16
            ),
          )
        ),
      body: Container(
        child: Column(
          children: [
            TimeLineMonth()
          ],
        ),
      ),
    );
  }
}