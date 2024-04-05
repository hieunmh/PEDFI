import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Stockscreen extends StatefulWidget {
  const Stockscreen({super.key});

  @override
  State<Stockscreen> createState() => _StockscreenState();
}

class _StockscreenState extends State<Stockscreen> {
  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color bgcolor = themeState.getDarkTheme ? Colors.black87 : Colors.white70;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: color,
            size: 30,
          )
        ),
        title: Text(
          'Stock screen',
          style: TextStyle(
            color: color
          ),
        ),
        
      ),
      body: const Column(
        children: [

      ],),
    );
  }
}