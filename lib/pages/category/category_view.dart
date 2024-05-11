import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/category/category_controller.dart';
import 'package:pedfi/pages/category/expense_category.dart';
import 'package:pedfi/pages/category/income_category.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: 0.2
                )
              )
            ),
            child: Obx(() =>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.showInputSearch.value) {
                        controller.setShowInputSearch(false);
                        return;
                      }
                      Get.back();
                    },
                    child: Icon(
                      FontAwesomeIcons.chevronLeft,
                      size: 20,
                      color: color,
                    ),
                  ),

                  const SizedBox(width: 10),
              
                  controller.showInputSearch.value ? Expanded(
                    child: SizedBox(
                      height: 20,
                      child: TextField(
                        autofocus: true,
                        controller: controller.searchController,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: color,
                          fontSize: 14
                        ),
                        keyboardType: TextInputType.text,
                        cursorColor: color,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(7.5),
                          border: InputBorder.none,
                          hintText: 'Search category . . .', 
                          hintStyle:  TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          )
                        ),
                      ),
                    ),
                  )
              
                  : Text(
                    'Select category',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                  const SizedBox(width: 10),
              
                  GestureDetector(
                    onTap: () {
                      controller.setShowInputSearch(true);
                    },
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: color,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColor.commonColor,
                      // indicator: const BoxDecoration(
                      //   color: AppColor.commonColor
                      // ),
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      labelColor: AppColor.commonColor,
                      unselectedLabelColor: color,
                      dividerColor: Colors.grey,
                      dividerHeight: 0.2,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Income',
                            style: TextStyle(
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ]
                    ),
          
                    const Expanded(
                      child: TabBarView(
                        children: [
                          IncomeCategory(),
          
                          ExpenseCategory()
                        ]
                      )
                    )
                  ],
                ),
              )
            )
          )
        ],
      )
    );
  }
}