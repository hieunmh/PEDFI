import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/overview/overview_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class History extends GetView<OverviewController> {
  const History({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsets.all(0),
      child: Obx(() =>
        ScrollConfiguration(
          key: const PageStorageKey<String>('cryptocurrency'),
          behavior: const ScrollBehavior(),
          child: GridView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              mainAxisExtent: 90
            ),
            children: controller.historyList.map(
              (item) => Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: themeState.getDarkTheme ? Colors.grey.shade800 : Colors.grey.shade300
                    )
                  )
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              item['coin_id'] ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color,
                                fontSize: 16
                              ),
                            ),

                            const SizedBox(width: 5),

                            Text(
                              item['type_order'] ? 'Buy' : 'Sell',
                              style: TextStyle(
                                color: item['type_order'] ? AppColor.incomeDarkColor
                                : AppColor.expenseDarkColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),

                        Text(
                          DateFormat('HH:mm dd/MM/yyyy').format(DateTime.parse(item['created_at'])).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        ),

                        Text(
                          item['amount'].abs().toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Average price',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        ),

                        Text(
                          item['price'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ).toList(),
          ),
        ),
      ),
    );
  }
}