import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/custom_categogy/custom_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoryType extends GetView<CustomCategoryController> {
  const CategoryType({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Obx(() =>
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.typecategory.value = 'income';
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                    border: Border.all(
                      color: controller.typecategory.value == 'income' ?
                      AppColor.incomeDarkColor : Colors.transparent,
                      width: 2.5
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: controller.typecategory.value == 'income' ? 
                        AppColor.incomeDarkColor : color
                      ),
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(width: 10),
            
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.typecategory.value = 'expense';
                },
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                    border: Border.all(
                      color: controller.typecategory.value == 'expense' ?
                      AppColor.expenseDarkColor : Colors.transparent,
                      width: 2.5
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: controller.typecategory.value == 'expense' ? 
                        AppColor.expenseDarkColor : color
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
          
          ],
        ),
      ),
    );
  }
}