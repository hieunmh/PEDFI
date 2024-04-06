import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Home screen',
            style: TextStyle(
              color: color
            )
            
          ),
        ),
      ),
    );
  }
}