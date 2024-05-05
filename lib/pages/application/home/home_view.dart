import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends GetView<HomeController>  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    // final Color bgcolor = themeState.getDarkTheme ? 
    // AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60, 
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.commonColor
                  ),
                ),

                const SizedBox(width: 10),

                Obx(() =>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome to pedfi!',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      ),
                      Text(
                        ProfileController().userEmail.value,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: AppColor.commonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    '\$1100',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(CupertinoIcons.arrow_down, size: 12),
                              ),
                            ),
                    
                            const SizedBox(width: 10),
                    
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Incoming',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                    
                                Text(
                                  '\$2600',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: const Center(
                                child: Icon(CupertinoIcons.arrow_up, size: 12),
                              ),
                            ),
                    
                            const SizedBox(width: 10),
                    
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                    
                                Text(
                                  '\$1500',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  
}