import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/consts/category_icon.dart';
import 'package:pedfi/pages/custom_categogy/category_type.dart';
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
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          toolbarHeight: 40,
          scrolledUnderElevation: 0.0,
          backgroundColor: bgcolor,
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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                FontAwesomeIcons.check,
                color: color,
              ),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CategoryType(),
      
                Obx(() =>
                  Center(
                    child: Image.asset(
                      'assets/categoryicon/${controller.selectIcon.value}',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade500
                        )
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        cursorColor: color,
                        controller: controller.newCategory,
                        style: TextStyle(
                          color: color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter category name',
                          hintStyle:  TextStyle(
                            color: themeState.getDarkTheme ? 
                            const Color.fromRGBO(255, 255, 255, 0.3)
                            : const Color.fromRGBO(0, 0, 0, 0.3),
                            fontWeight: FontWeight.w500
                          ),
                          
                        ),
                      ),
                    ),
                  ),
                ),
      
                const SizedBox(height: 20),
      
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Obx(() =>
                      ScrollConfiguration(
                        key: const PageStorageKey<String>('iconcategory'),
                        behavior: const ScrollBehavior(),
                        child: GridView(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: (Get.width - 60) / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.3
                          ),
                          children: categoryIcon.map(
                            (item) => GestureDetector(
                              onTap: () {
                                controller.selectIcon.value = item;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                                  border: Border.all(
                                    color: controller.selectIcon.value == item ? 
                                    themeState.getDarkTheme ? Colors.grey.shade700 : Colors.grey.shade400 : 
                                    Colors.transparent,
                                    width: 2.5
                                  ),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/categoryicon/$item',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            )
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      
      ),
    );
  }
}