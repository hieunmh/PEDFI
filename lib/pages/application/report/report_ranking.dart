import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ReportRanking extends GetView<ReportController> {
  const ReportRanking({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: ''
    );
    
    return Obx(() =>
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Ranking transaction',
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.rankingTransaction.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.rankingTransaction[index].image!.isEmpty ?
                                  'assets/categoryicon/${controller.rankingTransaction[index].category?['image']}'
                                  : 'assets/categoryicon/${controller.rankingTransaction[index].image}',
                                height: 30,
                                width: 30,
                              ),
                  
                              const SizedBox(width: 12),
                  
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.rankingTransaction[index].name!.isEmpty ?
                                    controller.rankingTransaction[index].category!['name'] 
                                    : controller.rankingTransaction[index].name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                  
                                  Text(
                                    GetUtils.capitalizeFirst(controller.rankingTransaction[index].description).toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    controller.rankingTransaction[index].value > 0 ?
                                    '+${currencyFormat.format(controller.rankingTransaction[index].value)}'
                                    : currencyFormat.format(controller.rankingTransaction[index].value),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.rankingTransaction[index].value > 0 ? 
                                      AppColor.incomeDarkColor : AppColor.expenseDarkColor,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
          
                                  Icon(
                                    FontAwesomeIcons.dongSign,
                                    size: 14,
                                    color: controller.rankingTransaction[index].value > 0 ? 
                                    AppColor.incomeDarkColor : AppColor.expenseDarkColor,
                                  )
                                ],
                              ),
                              Text(
                                DateFormat('EEE dd/MM')
                                .format(DateTime.parse(controller.rankingTransaction[index].date))
                                .toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}