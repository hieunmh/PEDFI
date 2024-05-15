import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:provider/provider.dart';

class TranCatergory extends GetView<CreateTranController> {
  const TranCatergory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   border: Border(
          //     bottom: BorderSide(
          //       color: color,
          //       width: 0.2
          //     )
          //   )
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700  
                  )
                ),
              ),
        
              const SizedBox(width: 20),
              
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.CATEGORY);
                },
                child: Text(
                  'Add / Edit',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: Colors.grey.shade500
                  ),
                ),
              )
            ],
          ),
        ),

        Obx(() =>
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: controller.trantype.value == 'income' ? 
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ScrollConfiguration(
                  key: const PageStorageKey<String>('incomecategory'),
                  behavior: const ScrollBehavior(),
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 60,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.3
                    ),
                    children: controller.incomeCategory.map(
                      (item) => GestureDetector(
                        onTap: () {
                          controller.setSelectCategory(item.name, item.id);
                        },
                        child: Container(
                          // height: 60,
                          decoration:  BoxDecoration(
                            color: themeState.getDarkTheme ? 
                            Colors.grey.shade900 : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: controller.selectCategory.value == item.name ? 
                              AppColor.incomeDarkColor : Colors.transparent,
                              width: 2.5
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/categoryicon/${item.image}',
                                height: 20,
                                width: 20,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item.name,
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                                ),
                              )
                            ],
                          ) 
                        
                        ),
                      )
                    ).toList(),
                  ),
                ),
              )
                : 
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ScrollConfiguration(
                  key: const PageStorageKey<String>('expensecategory'),
                  behavior: const ScrollBehavior(),
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 60,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.3
                    ),
                    children: controller.expenseCategory.map(
                      (item) => GestureDetector(
                        onTap: () {
                          controller.setSelectCategory(item.name, item.id);
                        },
                        child: Container(
                          // height: 60,
                          width: 400,
                          decoration:  BoxDecoration(
                            color: themeState.getDarkTheme ? 
                            Colors.grey.shade900 : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: controller.selectCategory.value == item.name ? 
                              AppColor.expenseDarkColor : Colors.transparent,
                              width: 2.5
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/categoryicon/${item.image}',
                                height: 20,
                                width: 20,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                item.name,
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                                ),
                              )
                            ],
                          ) 
                        
                        ),
                      )
                    ).toList(),
                  ),
                ),
              )
          ),
        ),

      ],
    );
  }
}