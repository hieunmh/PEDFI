import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EditItem extends StatelessWidget {
  const EditItem({super.key, required this.widget, required this.title});

  final Widget widget;
  final String title;

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black87;
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: color
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 8,
          child: widget,
        )
      ],
    );
  }
}