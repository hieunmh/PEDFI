import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/stock/stock_screen.dart';
import 'package:pedfi/widgets/profile/account.dart';
import 'package:pedfi/widgets/profile/alert_signin.dart';
import 'package:pedfi/widgets/profile/setting_item.dart';
import 'package:pedfi/widgets/profile/settting_switch.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>  {
  String userEmail = '';
  bool isLoggedIn = false;
  String joinDate = '';

  Future<void> _getProfile() async {
    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();
  
    if (email == null || createdAt == null) {
      return;
    } else {
      userEmail = email;

      final formatter = DateFormat('MMMM yyyy');

      joinDate = formatter.format(DateTime.parse(createdAt)).toString();
      isLoggedIn = true;
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();

  }

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
          child: Text(
            'Profile',
            style: TextStyle(
              color: color,
              fontSize: 36,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

               SizedBox(
                width: double.infinity,
                child: Account(
                  isLoggedIn: isLoggedIn, 
                  userEmail: userEmail,
                  createdAt: joinDate,
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
                // bgColor: themeState.getDarkTheme ? 
                // Colors.green.shade500 : Colors.green.shade200,
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
                        return const AlertSignin();
                      }
                    );
                  }
                },
              ),

              const SizedBox(height: 20),

              SettingItem(
                title: 'Currency',
                icon: CupertinoIcons.money_dollar,
                // bgColor: themeState.getDarkTheme ? 
                // Colors.green.shade500 : Colors.green.shade500,
                iconColor: themeState.getDarkTheme? Colors.white : Colors.black87,
                value: 'USD',
                onTap: () {
                  
                },
              ),

              const SizedBox(height: 20),

              SettingSwitch(
                title: 'Dark mode', 
                // bgColor: themeState.getDarkTheme ? 
                // const Color.fromRGBO(201, 215, 216, 0.2) 
                // : Colors.orange.shade100, 
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
    );
  }
}
