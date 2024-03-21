import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/account_screen.dart';
import 'package:pedfi/screens/home_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  int currentScreenIndex = 0;
  
  final List _screens = [
    const HomeScreen(),
    const AccountScreen()
  ];

  void _selectScreen(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: _screens[currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreenIndex,
        onDestinationSelected: _selectScreen,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 0.5,
        indicatorColor: themeState.getDarkTheme ? 
          Theme.of(context).dialogBackgroundColor : Colors.grey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home), label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle), label: 'Account'
          ),
        ], 
      ),
    );
  }
}