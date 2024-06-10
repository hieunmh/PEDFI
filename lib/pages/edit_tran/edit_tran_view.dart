import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/edit_tran/edit_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EditTransactionPage extends GetView<EditTransactionController> {
  const EditTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0.0,
          toolbarHeight: 35,
          backgroundColor: bgcolor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: color,
                size: 20,
              )
            ),
          ),
          title: Text(
            'Edit transaction',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 20
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              controller.argumentData['id'] ?? ''
            ),
          ],
        ),
      ),
    );
  }

  
}