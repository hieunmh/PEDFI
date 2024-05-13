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
                    color: color
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
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.incomeCategory.map((item) {
                  return GestureDetector(
                    onTap: () {
                      controller.setSelectIncome(item.name);
                    },
                    child: Obx(() =>
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width / 2 - 25,
                        decoration:  BoxDecoration(
                          color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.selectIncome.value == item.name ? 
                            AppColor.incomeDarkColor : Colors.transparent,
                            width: 2.5
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/income/${item.image}',
                              height: 20,
                            ),
                      
                            const SizedBox(width: 10),
                      
                            Text(
                              item.name,
                              style:  TextStyle(
                                color: color,
                                fontWeight:  FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  );
                }).toList(),
              ) : Wrap(
                spacing: 10,
                runSpacing: 10,
                children: controller.expenseCategory.map((item) {
                  return GestureDetector(
                    onTap: () {
                      controller.setSelectIncome(item.name);
                    },
                    child: Obx(() =>
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.width / 2 - 25,
                        decoration:  BoxDecoration(
                          color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.selectIncome.value == item.name ? 
                            AppColor.expenseDarkColor : Colors.transparent,
                            width: 2.5
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/expense/${item.image}',
                              height: 20,
                            ),
                      
                            const SizedBox(width: 10),
                      
                            Text(
                              item.name,
                              style:  TextStyle(
                                color: color,
                                fontWeight:  FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  );
                }).toList(),
              ),
          ),
        ),

      ],
    );
  }
}