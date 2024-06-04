import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/category/category_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ExpenseCategory extends GetView<CategoryController> {
  const ExpenseCategory({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(() =>
        ScrollConfiguration(
          key: const PageStorageKey<String>('incomecategory'),
          behavior: const ScrollBehavior(),
          child: GridView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              mainAxisExtent: 70
            ),
            children: controller.appController.expenseCategory.map(
              (element) => Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: themeState.getDarkTheme ? Colors.grey.shade900 : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/categoryicon/${element.image}',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              element.name,
                              style: TextStyle(
                                color: color,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context, 
                              builder: (_) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  backgroundColor: bgcolor,
                                  content: Text(
                                    'Are you sure to delete this item?',
                                    style: TextStyle(
                                      color: color
                                    ),
                                  ),
                                  contentTextStyle: const TextStyle(
                                    fontWeight: FontWeight.w700
                                  ),
                                  actionsAlignment: MainAxisAlignment.spaceBetween,
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteCategory(element.id);
                                        Get.back();
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: AppColor.commonColor,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back(closeOverlays: true);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            );
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              // color: AppColor.commonColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                              )
                            ),
                            child: const Icon(
                              FontAwesomeIcons.trash,
                              color: AppColor.commonColor,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ).toList(),
          ),
        ),
      )
    );
  }
}