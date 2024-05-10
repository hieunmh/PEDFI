import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TimeLineMonth extends GetView<HomeController> {
  const TimeLineMonth({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: themeState.getDarkTheme ?  Colors.grey : Colors.grey
          )
        )
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      height: 40,
      child: ListView.builder(
        key: const PageStorageKey<String>('timelinemonth'),
        controller: controller.scrollController,
        itemCount: controller.month.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(() =>
            GestureDetector(
              onTap: () {
                controller.setCurrentMonth(controller.month[index]);
                controller.scrollToCurrentMonth();
                controller.setFirstLastDay(controller.currentMonth.value);
              },
              child: Container(
                width: 90,
                decoration: controller.currentMonth.value == controller.month[index] ? 
                  const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: AppColor.commonColor
                      )
                    ),
    
                  ) : const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3,
                        color: Colors.transparent
                      )
                    ),
                  ),
                child: Center(
                  child: Text(
                    controller.month[index],
                    style: TextStyle(
                      color: controller.currentMonth.value == controller.month[index] ? color : Colors.grey,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}