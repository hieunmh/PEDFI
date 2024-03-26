import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/profile/profile_detail.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white70 : Colors.black87;
    final Color bgcolor = themeState.getDarkTheme ? Colors.black87 : Colors.white70;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text(
          'Profile',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 100, height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/meo.jpg'),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailScreen()
                    )
                  );
                },
              ),
              
              SwitchListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(color: color),
                ),
                secondary: Icon(
                  themeState.getDarkTheme ? CupertinoIcons.moon_stars_fill : CupertinoIcons.sun_max_fill,
                  color: color,
                ),
                onChanged: (bool value) {
                  themeState.setDarkTheme = value;
                },
                value: themeState.getDarkTheme,
                activeColor: const Color.fromRGBO(24, 119, 242, 1),
              ),
            ],
          ),
        )
      ),
    );
  }
}
