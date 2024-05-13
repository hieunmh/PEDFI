import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class TranCatergory extends GetView<CreateTranController> {
  const TranCatergory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    return Column(
      children: [
        Container(
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
              
            ],
          ),
        ),

         Container(
          height: 100,
          padding: const EdgeInsets.all(0),
          child: ListView.builder(
            itemCount: controller.incomeCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: 80,
                child: Row(
                  children: [
                    
                  ],
                ),
              );
            }
          ),

        )
      ],
    );
  }
}