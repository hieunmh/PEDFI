import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/auth/signin_screen.dart';
import 'package:pedfi/screens/profile/profile_detail.dart';
import 'package:pedfi/widgets/profile/foward_button.dart';
import 'package:provider/provider.dart';

class AccountDetail extends StatelessWidget {

  final bool isLoggedIn;
  final String userEmail;
  final String createdAt;

  const AccountDetail({
    super.key, 
    required this.isLoggedIn, 
    required this.userEmail,
    required this.createdAt
  });

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
                userEmail,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: color
                ),
              ),
              const SizedBox(height: 10),
               Text(
                'Joined $createdAt',
                style: const TextStyle(
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