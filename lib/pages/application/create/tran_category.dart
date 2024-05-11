import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:provider/provider.dart';

class TranCatergory extends GetView<CreateTranController> {
  const TranCatergory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Container(
      padding: const EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       color: color,
      //       width: 0.2
      //     )
      //   )
      // ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              'Category',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700  
              )
            ),
          ),

          const SizedBox(width: 20),
          
          GestureDetector(
            onTap: () async {
              var data = await Get.toNamed(AppRoutes.CATEGORY);
              if (data == null) {
                return;
              } 
              controller.categoryname.value = data['name'] ?? '';
              controller.categoryicon.value = data['icon'];
            },
            child: Obx(() =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    controller.categoryicon.value,
                    size: 20,
                    color: Colors.grey,
                  ),
            
                  const SizedBox(width: 10),
            
                  Text(
                    controller.categoryname.value,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}