import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/calendar/calendar_view.dart';
import 'package:pedfi/pages/application/home/home_view.dart';
import 'package:pedfi/pages/application/profile/proflie_view.dart';
import 'package:pedfi/pages/application/report/report_view.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:provider/provider.dart';

class ApplicationPage extends GetView<ApplicationController> {
  
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Obx(() =>
      Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.handlePageChange(index);
          },
          children: const [
            HomePage(),
            // CreateTransactionPage(),
            ReportPage(),
            CalendarPage(),
            ProfilePage(),
          ],
        ),
        floatingActionButton: controller.state.value == 0 ? FloatingActionButton.small(
          backgroundColor: AppColor.commonColor,
          onPressed: () {
            Get.toNamed(AppRoutes.CREATE_TRANSACTION);
          },
          child: const Icon(
            size: 18,
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ) : null,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5
              )
            )
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: bgcolor,
              items: controller.bottomNavBar,
              currentIndex: controller.state.value,
              onTap: controller.handleNavBarTap,
              unselectedItemColor: themeState.getDarkTheme ? Colors.white : Colors.grey.shade500,
              selectedItemColor: AppColor.commonColor,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12
              ),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12
              ),
              
            ),
          ),
        ),      
      ),
    );
  }
}