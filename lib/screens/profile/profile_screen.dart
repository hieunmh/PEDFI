import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/stock/stock_screen.dart';
import 'package:pedfi/widgets/account.dart';
import 'package:pedfi/widgets/setting_item.dart';
import 'package:pedfi/widgets/settting_switch.dart';
import 'package:provider/provider.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>  {

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    const isLoggedIn = false;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text(
          'Profile',
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
              const SizedBox(
                width: double.infinity,
                child: Account(isLoggedIn: isLoggedIn)
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
                title: 'Virtual Stock',
                icon: CupertinoIcons.waveform_path_ecg,
                bgColor: themeState.getDarkTheme ? Colors.green.shade500 : Colors.green.shade200,
                iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                value: '',
                onTap: () {
                  if (isLoggedIn == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Stockscreen() 
                      )
                    );
                  } else {
                    showDialog(context: context, 
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: const EdgeInsets.all(15),
                          backgroundColor: themeState.getDarkTheme 
                          ? const Color.fromRGBO(38, 38, 38, 1) : Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          content: Container(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'You need to sign in first!',
                                  style: TextStyle(
                                    color: color,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'You need to sign in to use this feature',
                                  style: TextStyle(
                                    color: themeState.getDarkTheme ? Colors.grey[600] : Colors.grey[500],
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: 'Dark mode', 
                bgColor: themeState.getDarkTheme ? 
                const Color.fromRGBO(201, 215, 216, 0.2) 
                : Colors.orange.shade100, 
                iconColor: themeState.getDarkTheme ? 
                const Color.fromRGBO(201, 215, 216, 1) : Colors.orange, 
                icon: themeState.getDarkTheme ? 
                CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill, 
                value: themeState.getDarkTheme, 
                onTap: (bool value) {
                  themeState.setDarkTheme = value;
                }
              ),
              TextFormField(
                onFieldSubmitted: (value) async {
                  // await Supabase.instance.client.from('notes')
                  // .insert({'content': value});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
