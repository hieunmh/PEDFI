import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class GoogleProvider extends StatelessWidget {
  const GoogleProvider({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    

    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(thickness: 0.5, color: Colors.grey)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Or continue with',
                style: TextStyle(
                  color: themeState.getDarkTheme ? 
                  Colors.grey[200] : Colors.grey[700]
                ),
              ),
            ),
            const Expanded(
              child: Divider(thickness: 0.5, color: Colors.grey)
            ),
          ],
        ),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: themeState.getDarkTheme ? Colors.white12 : Colors.black12
              ),
              child: Image.asset(
                'assets/images/google.png',
                height: 40,
              ),
            )
          ],
        ),

        const SizedBox(height: 30),

      ],
    );
  }
}