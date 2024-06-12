import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/market/market_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:pedfi/pages/stock/Components/item.dart';


class MarketPage extends GetView<MarketController> {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double myHeight = MediaQuery.of(context).size.height;
    // double myWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme
        ? AppColor.textDarkThemeColor
        : AppColor.textLightThemeColor;

    final Color bgColor = themeState.getDarkTheme
        ? AppColor.bgDarkThemeColor
        : AppColor.bgLightThemeColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                FontAwesomeIcons.chevronLeft,
                color: color,
                size: 20,
              )
            ),
          ),
        title: Text(
          "Stock Market",
          style: TextStyle(
            color: color,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coins List",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color),
                )
              ],
            ),
          ),
          
          Expanded(
            child: controller.isRefreshing.value == true ? 
            const Center(
              child: CircularProgressIndicator(),
            )
            : ListView.builder(
              itemCount: controller.coinMarket.length,
              itemBuilder: (context, index) {
                return Item(
                  item: controller.coinMarket[index],
                );
              }
            )
          ),
        ],
      ),
    );
  }
}
