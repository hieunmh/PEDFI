import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/square_title.dart';
import 'package:provider/provider.dart';

class GoogleProvider extends StatelessWidget {
  const GoogleProvider({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    // final Color color = themeState.getDarkTheme ? 
    // AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    

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

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTitle(imagePath: 'assets/images/google.png')
          ],
        ),

        const SizedBox(height: 30),

      ],
    );
  }
}