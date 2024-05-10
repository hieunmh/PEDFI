import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/stock_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:pedfi/pages/stock/home.dart';

class StockPage extends GetView<StockController> {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color textColor = themeState.getDarkTheme
        ? AppColor.textDarkThemeColor
        : AppColor.textLightThemeColor;

    final Color bgColor = themeState.getDarkTheme
        ? AppColor.bgDarkThemeColor
        : AppColor.bgLightThemeColor;

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: bgColor,
    //   ),
    //   body: Obx(
    //     () => SingleChildScrollView(
    //       child: Row(
    //         children: [
    //           Text(
    //             'Stock',
    //             style: TextStyle(color: color),
    //           ),
    //           Text(
    //             controller.count.value,
    //             style: TextStyle(color: color),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.handlePageChange(index);
        },
        children: const [Home(), Home(), Home(), Home()],
      ),
      bottomNavigationBar: Obx(() => Container(
            decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.grey, width: 0.5))),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: bgColor,
                currentIndex: controller.state.value,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: const Color(0xffFBC700),
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                onTap: controller.handleNavBarTap,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/1.1.png',
                      height: myHeight * 0.03,
                      color: Colors.grey,
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/1.2.png',
                      height: myHeight * 0.03,
                      color: Color(0xffFBC700),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/2.1.png',
                      height: myHeight * 0.03,
                      color: Colors.grey,
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/2.2.png',
                      height: myHeight * 0.03,
                      color: Color(0xffFBC700),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/3.1.png',
                      height: myHeight * 0.03,
                      color: Colors.grey,
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/3.2.png',
                      height: myHeight * 0.03,
                      color: Color(0xffFBC700),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/4.1.png',
                      height: myHeight * 0.03,
                      color: Colors.grey,
                    ),
                    label: '',
                    activeIcon: Image.asset(
                      'assets/icons/4.2.png',
                      height: myHeight * 0.03,
                      color: Color(0xffFBC700),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
