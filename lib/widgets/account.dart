import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/profile/signin_screen.dart';
import 'package:pedfi/screens/profile/profile_detail.dart';
import 'package:pedfi/widgets/foward_button.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {

  final bool isLoggedIn;

  const Account({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return isLoggedIn ? Row(
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
                  builder: (context) => const ProfileDetail()
                )
              );
            }
          )
        ],
    ) : Row(
      children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/placeholder.jpg', width: 70, height: 70),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign in / Sign up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: color
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to save your data',
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
                  builder: (context) => const SigninScreen()
                )
              );
            }
          )
        ],
    );
  }
}