import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/transaction/transaction_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TabSelect extends GetView<TransactionController> {
  const TabSelect({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return  Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColor.commonColor,
              indicatorWeight: 1,
              unselectedLabelColor: Colors.green,
              dividerColor: themeState.getDarkTheme ? Colors.grey.shade600 : Colors.grey.shade300,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                Tab(
                  child: Text(
                    'Income',
                    style: TextStyle(
                      color: color
                    ),
                  ),
                ),

                Tab(
                  child: Text(
                    'Expense',
                    style: TextStyle(
                      color: color
                    ),
                  ),
                ),
                
              ]
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      'Income',
                      style: TextStyle(
                        color: color
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      'Select',
                      style: TextStyle(
                        color: color
                      ),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}