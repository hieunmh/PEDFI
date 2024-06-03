import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeTransaction extends GetView<HomeController> {
  const HomeTransaction({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: ''
    );

    return Obx(() =>
      Expanded(
        child: controller.filterTransaction.isNotEmpty ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: ListView.builder(
            key: const PageStorageKey<String>('transaction'),
            controller: controller.tranScroll,
            itemCount: controller.filterTransaction.length,
            itemBuilder: (context, index) {
              return Container(
                padding: index == controller.filterTransaction.length - 1 ? 
                const EdgeInsets.fromLTRB(0, 0, 0, 50) :
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                child:
                  Slidable(
                    startActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          icon: Icons.edit_rounded,
                          label: 'edit',
                          backgroundColor: AppColor.incomeDarkColor,
                          foregroundColor: Colors.white,
                          onPressed: (BuildContext context) {
                            
                          },
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          icon: Icons.delete,
                          label: 'delete',
                          backgroundColor: AppColor.commonColor,
                          foregroundColor: Colors.white,
                          onPressed: (BuildContext context) {
                            controller.deleteTransaction(controller.filterTransaction[index].id);
                          },
                        )
                      ],
                    ),
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
                                  controller.filterTransaction[index].image!.isEmpty ?
                                  'assets/categoryicon/${controller.filterTransaction[index].category?['image']}'
                                  : 'assets/categoryicon/${controller.filterTransaction[index].image}',
                                  height: 30,
                                  width: 30,
                                ),
                    
                                const SizedBox(width: 12),
                    
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.filterTransaction[index].category?['name'] ?? 
                                      controller.filterTransaction[index].name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: color,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                    
                                    Text(
                                      GetUtils.capitalizeFirst(controller.filterTransaction[index].description).toString(),
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
                                      controller.filterTransaction[index].value > 0 ?
                                      '+${currencyFormat.format(controller.filterTransaction[index].value)}'
                                      : currencyFormat.format(controller.filterTransaction[index].value),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: controller.filterTransaction[index].value > 0 ? 
                                        AppColor.incomeDarkColor : AppColor.expenseDarkColor,
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),

                                    Icon(
                                      FontAwesomeIcons.dongSign,
                                      size: 14,
                                      color: controller.filterTransaction[index].value > 0 ? 
                                      AppColor.incomeDarkColor : AppColor.expenseDarkColor,
                                    )
                                  ],
                                ),
                                Text(
                                  DateFormat('EEE dd/MM')
                                  .format(DateTime.parse(controller.filterTransaction[index].date))
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
                  ),
                
              );
            }
          ),
        ) : Container(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.faceFrown,
                  color: color,
                  size: 60,
                ),

                const SizedBox(height: 10),

                Text(
                  'No transaction found',
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}