import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/News/page.dart';
import 'package:pedfi/pages/stock/history.dart';
import 'package:pedfi/pages/stock/overview/overview_view.dart';
import 'package:pedfi/pages/stock/stock_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:pedfi/pages/stock/market/market_view.dart';
import 'package:pedfi/pages/stock/coinSelect.dart';

class StockPage extends GetView<StockController> {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = Get.height;

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color bgColor = themeState.getDarkTheme
        ? AppColor.bgDarkThemeColor
        : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.handlePageChange(index);
        },
        children: const [MarketPage(), CoinSelect(), NewsPage(), OverviewPage()],
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
                  'assets/icons/7.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/7.2.png',
                  height: myHeight * 0.03,
                  color: Color(0xffFBC700),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/6.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/6.2.png',
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
    );
  }
}
