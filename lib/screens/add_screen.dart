import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
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
            'Add screen',
            style: TextStyle(
              color: color
            )
            
          ),
        ),
      ),
    );
  }
}