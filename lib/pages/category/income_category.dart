import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/category/category_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class IncomeCategory extends GetView<CategoryController> {
  const IncomeCategory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ListView.builder(
        itemCount: controller.incomeCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // controller.setCategory(
              //   controller.incomeList[index]['icon'], 
              //   controller.incomeList[index]['name']
              // );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.grey
                  )
                )
            
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/categoryicon/${controller.incomeCategory[index].image}',
                    height: 30,
                    width: 30,
                  ),
          
                  const SizedBox(width: 10),
          
                  Text(
                    controller.incomeCategory[index].name,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
          
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}