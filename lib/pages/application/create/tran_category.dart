import 'package:flutter/cupertino.dart';
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

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text(
                  'Category',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  )
                ),
              ),
        
              const SizedBox(width: 20),
              
              GestureDetector(
                onTap: () async {
                  var data = await Get.toNamed(AppRoutes.CUSTOMCATEGORY);
                  if (data == null) {
                    return;
                  }
                  controller.selectCategory.value = data['name'] ?? '';
                  controller.selectCateId.value = data['id'] ?? '';
                },
                child: Text(
                  String.fromCharCode(CupertinoIcons.plus_app.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
              )
            ],
          ),
        ),

        Obx(() =>
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: controller.trantype.value == 'income' ? 
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ScrollConfiguration(
                  key: const PageStorageKey<String>('incomecategory'),
                  behavior: const ScrollBehavior(),
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1
                    ),
                    children: controller.incomeCategory.map(
                      (item) => GestureDetector(
                        onTap: () {
                          controller.setSelectCategory(item.name, item.id);
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            color: themeState.getDarkTheme ? 
                            Colors.grey.shade900 : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: controller.selectCategory.value == item.name ? 
                              AppColor.incomeDarkColor : Colors.transparent,
                              width: 2.5
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/categoryicon/${item.image}',
                                height: 30,
                                width: 30,
                              ),

                              Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                                ),
                              ),
                            ],
                          ) 
                        ),
                      )
                    ).toList(),
                  ),
                ),
              )
                : 
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ScrollConfiguration(
                  key: const PageStorageKey<String>('expensecategory'),
                  behavior: const ScrollBehavior(),
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: const PageScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1
                    ),
                    children: controller.expenseCategory.map(
                      (item) => GestureDetector(
                        onTap: () {
                          controller.setSelectCategory(item.name, item.id);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: 400,
                          decoration:  BoxDecoration(
                            color: themeState.getDarkTheme ? 
                            Colors.grey.shade900 : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: controller.selectCategory.value == item.name ? 
                              AppColor.expenseDarkColor : Colors.transparent,
                              width: 2.5
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/categoryicon/${item.image}',
                                height: 30,
                                width: 30,
                              ),

                              Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                                ),
                              ),
                            ],
                          ) 
                        
                        ),
                      )
                    ).toList(),
                  ),
                ),
              )
          ),
        ),

      ],
    );
  }
}