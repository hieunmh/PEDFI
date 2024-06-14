import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/stock/overview/crypto_currency.dart';
import 'package:pedfi/pages/stock/overview/overview_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class OverviewPage extends GetView<OverviewController> {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {

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
        // title: Text(
        //   "Account overview",
        //   style: TextStyle(
        //     color: color,
        //   ),
        // ),
        centerTitle: true,
      ),
      body: Obx(() =>
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total balance',
                    style:  TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  ),
          
                  const SizedBox(width: 10),
          
                  SizedBox(
                    width: 20,
                    child: controller.showTotalBalance.value ? GestureDetector(
                      onTap: () {
                        controller.setShowTotalBalance(false);
                      },
                      child: Icon(
                        FontAwesomeIcons.eye,
                        color: color,
                        size: 16,
                      ),
                    ) : GestureDetector(
                      onTap: () {
                        controller.setShowTotalBalance(true);
                      },
                      child: Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: color,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
          
              const SizedBox(height: 5),
          
              controller.showTotalBalance.value ? 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '100.000 USD',
                    style: TextStyle(
                      height: 1,
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                  )
                ],
              ) : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                  Icon(FontAwesomeIcons.starOfLife, color: color, size: 14),
                ],
              ),
          
              const Divider(),

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
                          splashFactory: NoSplash.splashFactory,
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          labelColor: color,
                          unselectedLabelColor: Colors.grey,
                          dividerColor: Colors.grey,
                          dividerHeight: 0.2,
                          tabs: const [
                            Tab(
                              child: Text(
                                'Cryptocurrency',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'History',
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
                              CryptoCurrency(),

                              Center(
                                child: Text('Tab 2'),
                              ),
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}