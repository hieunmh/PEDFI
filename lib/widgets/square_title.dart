import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class SquareTitle extends StatelessWidget {

  final String imagePath;
  const SquareTitle({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(16),
        color: themeState.getDarkTheme ? Colors.white12 : Colors.black12
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}