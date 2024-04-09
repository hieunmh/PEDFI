import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor,
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor,
      canvasColor: isDarkTheme ? AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
