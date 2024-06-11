import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/edit_tran/edit_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class EditTransactionDate extends GetView<EditTransactionController> {
  const EditTransactionDate({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              'Date',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
            ),
          ),

        const SizedBox(width: 20),
          
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setPreviousDay();
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: color,
                    size: 16,
                  ),
                ),

                Obx(() =>
                  GestureDetector(
                    onTap: () {
                      controller.showDateTimePicker(context, color);
                    },
                    child: Text(
                      controller.pickedDateTime.value.isEmpty ? 
                      DateFormat('E, dd MMMM, yyyy').format(DateTime.now()) :
                      DateFormat('E, dd MMMM, yyyy').format(
                        DateTime.parse(controller.pickedDateTime.value)
                      ),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),


                GestureDetector(
                  onTap: () {
                    controller.setNextDay();
                  },
                  child: Icon(
                    FontAwesomeIcons.chevronRight,
                    color: color,
                    size: 16,
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}