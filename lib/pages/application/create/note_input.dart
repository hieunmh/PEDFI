import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class NoteInput extends GetView<CreateTranController> {
  const NoteInput({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       color: color,
      //       width: 0.2
      //     )
      //   )
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              'Note',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              children: [
                TextField(
                  controller: controller.noteController,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: color,
                    fontSize: 14
                  ),
                  keyboardType: TextInputType.text,
                  cursorColor: color,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description', 
                    hintStyle:  TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                ),

                const SizedBox(height: 2.5)
              ],
            )
          )
        ],
      ),
    );
  }

  
}