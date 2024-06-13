import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/overview/overview_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CryptoCurrency extends GetView<OverviewController> {
  const CryptoCurrency({super.key});

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
              mainAxisExtent: 100
            ),
            children: controller.currencyList.map(
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
                        Text(
                          item['coinname'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: color
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 8),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['detail'] ?? '',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today PNL',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: Colors.grey.shade400, size: 6),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Average costs',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                            Icon(FontAwesomeIcons.starOfLife, color: color, size: 6),
                          ],
                        ),
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