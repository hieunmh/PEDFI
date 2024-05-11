import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          FontAwesomeIcons.chevronLeft,
          color: buttonColor, size: 18
        ),
      ),
    );
  }
}