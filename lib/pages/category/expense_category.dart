import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/category/category_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ExpenseCategory extends GetView<CategoryController> {
  const ExpenseCategory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ListView.builder(
          itemCount: controller.expenseCategory.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/categoryicon/${controller.expenseCategory[index].image}',
                    height: 30,
                    width: 30,
                  ),
          
                  const SizedBox(width: 10),
          
                  Text(
                    controller.expenseCategory[index].name,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            );
          }
        ),
      
    );
  }
}