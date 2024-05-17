import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    
    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Obx(() =>
        ScrollConfiguration(
          key: const PageStorageKey<String>('incomecategory'),
          behavior: const ScrollBehavior(),
          child: GridView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1
            ),
            children: controller.createTranController.expenseCategory.map(
              (element) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2.5
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/categoryicon/${element.image}',
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            element.name,
                            style: TextStyle(
                              color: color,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 11
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: GestureDetector(
                      onTap: () {
                        controller.deleteCategory(element.id);
                      },
                      child: const Icon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: AppColor.commonColor,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ).toList(),
          ),
        ),
      )
    );
  }
}