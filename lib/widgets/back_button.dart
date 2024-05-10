import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class MyBackButton extends StatelessWidget {
  
  final Color buttonColor;
  const MyBackButton({super.key, required this.buttonColor});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);


    
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
          color: buttonColor, size: 25
        ),
      ),
    );
  }
}