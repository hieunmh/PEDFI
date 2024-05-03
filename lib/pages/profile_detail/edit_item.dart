import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EditItem extends GetView<ProfileDetailController> {

  final Widget widget;
  final String title;

  const EditItem({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal:20),
      decoration:  BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: themeState.getDarkTheme ? Colors.grey : Colors.black26,
            width: 0.5
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
      
          widget
        ],
      ),
    );
  }
}