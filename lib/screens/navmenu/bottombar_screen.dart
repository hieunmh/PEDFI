import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/add_screen.dart';
import 'package:pedfi/screens/home/home_screen.dart';
import 'package:pedfi/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[

  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.square_list_fill),
    icon: Icon(CupertinoIcons.square_list),
    label: 'Home',
  ),

  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.add_circled_solid),
    icon: Icon(CupertinoIcons.add_circled),
    label: 'Add',
  ),
  
  BottomNavigationBarItem(
    activeIcon: Icon(CupertinoIcons.person_fill),
    icon: Icon(CupertinoIcons.person),
    label: 'Profile',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  HomeScreen(),
  AddScreen(),
  ProfileScreen()
];

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int currentScreen = 0;

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    
    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    return Scaffold(
      body: bottomNavScreen[currentScreen],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5
            )
          )
        ),
        child: BottomNavigationBar(
          currentIndex: currentScreen,
          items: bottomNavItems,
          selectedItemColor: AppColor.commonColor,
          unselectedItemColor: color,
          onTap: (index) {
            setState(() {
              currentScreen = index;
            });
          },
        ),

      ),
    );
  }
}
