import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeTransaction extends GetView<HomeController> {
  const HomeTransaction({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    // final incomeColor = themeState.getDarkTheme ? AppColor.incomeDarkColor : AppColor.incomeLightColor;

    // final expenseColor = themeState.getDarkTheme ? AppColor.expenseDarkColor : AppColor.expenseLightColor;

    // final bgColor = themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100;

    final Color color = themeState.getDarkTheme ? AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: ListView.builder(
          key: const PageStorageKey<String>('transaction'),
          itemCount: controller.transactionsData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Colors.transparent
              ),
              child: Obx(() =>
                Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        icon: Icons.edit_rounded,
                        label: 'edit',
                        backgroundColor: AppColor.incomeDarkColor,
                        foregroundColor: Colors.white,
                        onPressed: (BuildContext context) {

                        },
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        icon: Icons.delete,
                        label: 'delete',
                        backgroundColor: AppColor.commonColor,
                        foregroundColor: Colors.white,
                        onPressed: (BuildContext context) {

                        },
                      )
                    ],
                  ),
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.2,
                          color: color
                        )
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                controller.transactionsData[index]['icon'],
                                color: color,
                                size: 20,
                              ),
                  
                              const SizedBox(width: 12),
                  
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.transactionsData[index]['name'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                  
                                  Text(
                                    controller.transactionsData[index]['detail'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.transactionsData[index]['totalAmount'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.transactionsData[index]['color'],
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                controller.transactionsData[index]['date'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      )
    );
  }
}