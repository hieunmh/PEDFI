
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:pedfi/widgets/profile/foward_button.dart';
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

    final formatter = DateFormat('MMMM yyyy');

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
          child: Obx(() =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                SizedBox(
                  child: controller.isLoggedin.value ? (
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/meo.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userEmail.value,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: color
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Join ${formatter.format(DateTime.parse(controller.joinDate.value)).toString()}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        ForwardButton(
                          onTap: () async {
                            var data = await Get.toNamed(
                              AppRoutes.PROFILE_DETAIL,
                              parameters: {
                                'userEmail': controller.userEmail.value,
                                'joinDate': controller.joinDate.value
                              }
                            );

                            if (data == null) {
                              return;
                            } else {
                              controller.userEmail.value = '';
                              controller.joinDate.value = '';
                              controller.isLoggedin.value = false;
                            }
                            
                          }
                        )
                      ],
                    )
                  ) : (
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/placeholder.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius: BorderRadius.circular(30)
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign in | Sign up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: color
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Sign in to save your data',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        ForwardButton(
                          onTap: () async {
                            var data = await Get.toNamed(AppRoutes.AUTH);
                            if (data == null) {
                              return;
                            }
                            controller.isLoggedin.value = data['isLoggedIn'];
                            controller.userEmail.value = data['userEmail'] ?? '';
                            controller.joinDate.value = data['joinDate'] ?? '';
                          }
                        )
                      ],
                    )
                  )
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
                
                const SizedBox(height: 20),
                
                SettingItem(
                  title: 'Virtual Stock',
                  icon: CupertinoIcons.waveform_path_ecg,
                  iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                  value: '',
                  onTap: () {
                    
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
                
                SettingSwitch(
                  title: 'Dark mode', 
                  iconColor: themeState.getDarkTheme ? 
                  const Color.fromRGBO(201, 215, 216, 1) : Colors.orange, 
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
      ),
    );
  }
}