import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/add_screen.dart';
import 'package:pedfi/screens/home/home_screen.dart';
import 'package:pedfi/screens/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

const List<Widget> bottomNavScreen = <Widget>[
  HomeScreen(),
  AddScreen(),
  ProfileScreen()
];

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());

    final themeState = Provider.of<DarkThemeProvider>(context);
    
    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      body: Obx(() => controller.screens[controller.currentScreen.value]),

      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5
              )
            )
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 0,
                  color: color,
                  fontWeight: FontWeight.w500
                ),
              )
            ),
            child: NavigationBar(
              height: 50,
              elevation: 0,
              selectedIndex: controller.currentScreen.value,
              onDestinationSelected: (int index) => controller.currentScreen.value = index,
              shadowColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              // indicatorShape: ShapeBorder,
              surfaceTintColor: Colors.transparent,
              backgroundColor: bgcolor,
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(CupertinoIcons.square_list_fill, 
                    color: AppColor.commonColor, size: 25,
                  ),
                  icon: Icon(CupertinoIcons.square_list, color: color, size: 25), 
                  label: ''
                ),
                NavigationDestination(
                  selectedIcon: const Icon(CupertinoIcons.add_circled_solid, 
                    color: AppColor.commonColor, size: 25,
                  ),
                  icon: Icon(CupertinoIcons.add_circled, color: color, size: 25), 
                  label: ''
                ),
                NavigationDestination(
                  selectedIcon: const Icon(CupertinoIcons.person_fill, 
                    color: AppColor.commonColor, size: 25,
                  ),
                  icon: Icon(CupertinoIcons.person, color: color, size: 25), 
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> currentScreen = 0.obs;

  final screens = [
    const HomeScreen(),
    const AddScreen(),
    const ProfileScreen()
  ];
}