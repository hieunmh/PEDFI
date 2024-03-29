import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/profile/profile_detail.dart';
import 'package:pedfi/widgets/foward_button.dart';
import 'package:pedfi/widgets/setting_item.dart';
import 'package:pedfi/widgets/settting_switch.dart';
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
        title: Text(
          'Settings',
          style: TextStyle(
            color: color,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/meo.jpg', width: 70, height: 70),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyen Minh Hieu',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: color
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Full stack developer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ForwardButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileDetailScreen()
                          )
                        );
                      }
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: color
                ),
              ),
              SettingItem(
                title: "Virtual Stock",
                icon: CupertinoIcons.waveform_path_ecg,
                bgColor: Colors.transparent,
                iconColor: Colors.grey,
                value: "",
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: 'Dark mode', 
                bgColor: Colors.transparent,
                // themeState.getDarkTheme ? 
                // Colors.purple.shade100 : Colors.orange.shade100, 
                iconColor: themeState.getDarkTheme ? 
                Colors.purple : Colors.orange, 
                icon: themeState.getDarkTheme ? 
                CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill, 
                value: themeState.getDarkTheme, 
                onTap: (bool value) {
                  themeState.setDarkTheme = value;
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
