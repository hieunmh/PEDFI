import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text('Theme'),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.nightlight_round
              : Icons.wb_sunny_outlined),
          onChanged: (bool value) {
            themeState.setDarkTheme = value;
          },
          value: themeState.getDarkTheme,
        ),
      ),
    );
  }
}
