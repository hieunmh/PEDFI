import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/custom_categogy/custom_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CustomCategoryPage extends GetView<CustomCategoryController> {
  const CustomCategoryPage({super.key});

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
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade500,
            width: 0.5
          )
        ),
        title: Text(
          'Custom',
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
            color: color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.incomeDarkColor
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                  
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.incomeDarkColor
                      ),
                    ),
                  ),
                
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  
}