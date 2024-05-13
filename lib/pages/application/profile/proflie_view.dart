
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/profile/profile_avatar.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:pedfi/widgets/profile/setting_item.dart';
import 'package:pedfi/widgets/profile/settting_switch.dart';
import 'package:provider/provider.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;


    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Text(
                'Profile',
                style:  TextStyle(
                  color: color,
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              )
            ]
          ),  
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                const ProfileAvatar(),
                
                const SizedBox(height: 40),
                
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: color
                  ),
                ),
                
                const SizedBox(height: 20),
                
                SettingItem(
                  title: 'Virtual Stock',
                  icon: CupertinoIcons.bitcoin,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: '',
                  onTap: () {
                    Get.toNamed(AppRoutes.STOCK);
                  },
                ),
                
                const SizedBox(height: 20),
                
                SettingItem(
                  title: 'Currency',
                  icon: CupertinoIcons.money_dollar,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: 'USD',
                  onTap: () {
                    
                  },
                ),
                
                const SizedBox(height: 20),

                SettingItem(
                  title: 'Category',
                  icon: CupertinoIcons.square_list,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: '',
                  onTap: () {
                    Get.toNamed(AppRoutes.CATEGORY);
                  },
                ),
                
                const SizedBox(height: 20),
                
                SettingSwitch(
                  title: 'Dark mode', 
                  iconColor: themeState.getDarkTheme ? 
                  Colors.white : Colors.orange, 
                  icon: themeState.getDarkTheme ? 
                  CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill, 
                  value: themeState.getDarkTheme, 
                  onTap: (bool value) {
                    themeState.setDarkTheme = value;
                  }
                ),
              ],
            ),
          ),
        ),
    );
  }
}