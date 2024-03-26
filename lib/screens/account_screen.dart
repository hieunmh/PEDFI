import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white70 : Colors.black87;

    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text(
            'Theme',
            style: TextStyle(color: color),
          ),
          secondary: Icon(
            themeState.getDarkTheme
              ? CupertinoIcons.moon_stars_fill
              : CupertinoIcons.sun_max_fill,
            color: color,
            ),
          onChanged: (bool value) {
            themeState.setDarkTheme = value;
          },
          value: themeState.getDarkTheme,
          activeColor: Colors.white54,
        ),
      ),
    );
  }
}
