import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class WalletTotal extends GetView<HomeController> {
  const WalletTotal({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeState.getDarkTheme ? Colors.black12 : Colors.grey.shade100,
      ),
      
      child: Obx(() =>
        Container(
          child: Text(
            controller.appController.isOnline.value ? 'Co mang' : 'Khong co mang'
          ),
        )
      ),
    );
  }
}