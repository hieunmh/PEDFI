import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black87;
    final Color bgcolor = themeState.getDarkTheme ? Colors.black87 : Colors.white70;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
      ),
      body: Column(
        children: [
          Text('Setting',
            style: TextStyle(
              fontSize: 36, 
              fontWeight: FontWeight.bold,
              color: color
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: color
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/meo.jpg', width: 70, height:70)
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyen Minh Hieu',
                      style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Detail',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 60, height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Icon(CupertinoIcons.forward),
                )
              ],
            ),
          ),
          // SwitchListTile(
          //   title: Text(
          //     'Theme',
          //     style: TextStyle(color: color),
          //   ),
          //   secondary: Icon(
          //     themeState.getDarkTheme 
          //     ? CupertinoIcons.moon_stars_fill : CupertinoIcons.sun_max_fill,
          //     color: color,
          //   ),
          //   onChanged: (bool value) {
          //     themeState.setDarkTheme = value;
          //   },
          //   value: themeState.getDarkTheme,
          //   activeColor: const Color.fromRGBO(24, 119, 242, 1),
          // ),
        ],
      )
    );
  }
}
