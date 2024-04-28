import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: themeState.getDarkTheme ? Colors.white10 : Colors.black12,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.back,
          color: color, size: 25
        ),
      ),
    );
  }
}