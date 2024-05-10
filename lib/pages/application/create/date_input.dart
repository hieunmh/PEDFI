import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class DateInput extends GetView<CreateTranController> {
  const DateInput({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return GestureDetector(
      onTap: () {
        controller.showDateTimePicker(context, color);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: color
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700
              ),
            ),
            
            Obx(() =>
              Text(
                controller.pickedDateTime.value.isEmpty ? 
                DateFormat('EEEE, dd MMMM, yyyy').format(DateTime.now()) :
                DateFormat('EEEE, dd MMMM, yyyy').format(DateTime.parse(controller.pickedDateTime.value)),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}