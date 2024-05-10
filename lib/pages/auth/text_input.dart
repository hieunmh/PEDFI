import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/auth/auth_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class InputPlaceholder extends GetView<AuthController> {

  final String hintText;
  final String placeholder;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final ctrler;
  final Color borderColor;
  final String errorMsg;

  const InputPlaceholder({
    super.key,
    required this.hintText,
    required this.placeholder,
    required this.obscureText,
    required this.ctrler,
    required this.borderColor,
    required this.errorMsg
  });
  
  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: TextStyle(
                color: color
              ),
            )
          ],
        ),

        const SizedBox(height: 5),

        Container(
          decoration: BoxDecoration(
            color: themeState.getDarkTheme ? 
            const Color.fromRGBO(30, 30, 30, 1) : Colors.grey[200],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor, width: 1) 
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextField(
              cursorColor: color,
              controller: ctrler,
              style: TextStyle(
                color: color
              ),
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle:  TextStyle(
                  color: themeState.getDarkTheme ? 
                  const Color.fromRGBO(255, 255, 255, 0.3)
                  : const Color.fromRGBO(0, 0, 0, 0.3)
                )
              ),
            ),
          ),
        ),

        errorMsg.isNotEmpty ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              errorMsg,
              style: const TextStyle(
                color: AppColor.commonColor,
                fontWeight: FontWeight.w500,
                fontSize: 12
              ),
            )
          ],
        ) : const SizedBox(height: 0),
      ],
    );
  }
}