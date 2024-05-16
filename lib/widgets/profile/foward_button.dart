import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ForwardButton extends StatelessWidget {
  final Function() onTap;

  const ForwardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60, height: 60,
        decoration: BoxDecoration(
          color: themeState.getDarkTheme ? Colors.black12 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          FontAwesomeIcons.chevronRight,
          size: 18,
        ),
      ),
    );
  }
}