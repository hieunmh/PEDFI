import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';


class CategoryController extends GetxController {

  var categoryIcon = FontAwesomeIcons.solidCircleQuestion.obs;
  var categoryName = 'Select category'.obs;

  var incomeCategory = Get.find<ApplicationController>().allCategory.where((item) => item.type == 'income').toList();
  var expenseCategory = Get.find<ApplicationController>().allCategory.where((item) => item.type == 'expense').toList();

  void setCategory(IconData categoryicon, String categoryname) {
    categoryIcon.value = categoryicon;
    categoryName.value = categoryname;
    Get.back(
      result: {
        'icon': categoryIcon.value,
        'name': categoryName.value
      }
    );
  }
}