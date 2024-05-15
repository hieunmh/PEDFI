import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Obx(() =>
          ListView.builder(
            reverse: true,
            key: const PageStorageKey<String>('transaction'),
            itemCount: controller.allTransaction.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                child:
                  Slidable(
                    startActionPane: ActionPane(
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
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          icon: Icons.delete,
                          label: 'delete',
                          backgroundColor: AppColor.commonColor,
                          foregroundColor: Colors.white,
                          onPressed: (BuildContext context) {
          
                          },
                        )
                      ],
                    ),
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 0.2,
                            color: color
                          )
                        )
                      ),
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
                                  'assets/categoryicon/${controller.allTransaction[index].category['image']}',
                                  height: 30,
                                  width: 30,
                                ),
                    
                                const SizedBox(width: 12),
                    
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // controller.appController.allTransaction[index].category_id
                                    Text(
                                      controller.allTransaction[index].category['name'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: color,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                    
                                    Text(
                                      GetUtils.capitalizeFirst(controller.allTransaction[index].description).toString(),
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
                                Text(
                                  currencyFormat.format(controller.allTransaction[index].value),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: controller.allTransaction[index].value > 0 ? 
                                    AppColor.incomeDarkColor : AppColor.expenseDarkColor,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy')
                                  .format(DateTime.parse(controller.allTransaction[index].date))
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
        ),
      )
    );
  }
}