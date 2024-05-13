import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';


class CategoryController extends GetxController {

  var showInputSearch = false.obs;

  var searchController = TextEditingController();

  var categoryIcon = FontAwesomeIcons.solidCircleQuestion.obs;
  var categoryName = 'Select category'.obs;

  var incomeCategory = Get.find<ApplicationController>().incomeCategory;
  var expenseCategory = Get.find<ApplicationController>().expenseCategory;

  final List expenseList = [
    {
      'icon': FontAwesomeIcons.fileInvoice,
      'name' : 'Bill'
    },
    {
      'icon': FontAwesomeIcons.mask,
      'name' : 'Beauty'
    },
    {
      'icon': FontAwesomeIcons.utensils,
      'name' : 'Food'
    },
    {
      'icon': FontAwesomeIcons.mugHot,
      'name' : 'Drink'
    },
    {
      'icon': FontAwesomeIcons.graduationCap,
      'name' : 'Education'
    },
    {
      'icon': FontAwesomeIcons.gamepad,
      'name': 'Entertainment'
    },
    {
      'icon': FontAwesomeIcons.gift,
      'name': 'Event'
    },
    {
      'icon': FontAwesomeIcons.shirt,
      'name': 'Fashion'
    },
    {
      'icon': FontAwesomeIcons.dumbbell,
      'name': 'Gym'
    },
    {
      'icon': FontAwesomeIcons.heartPulse,
      'name' : 'Health'
    },
    {
      'icon': FontAwesomeIcons.toolbox,
      'name' : 'Houseware'
    },
    {
      'icon': FontAwesomeIcons.cartShopping,
      'name': 'Shopping'
    },
    {
      'icon': FontAwesomeIcons.solidFutbol,
      'name' : 'Sport'
    },
    {
      'icon': FontAwesomeIcons.laptop,
      'name' : 'Techology'
    },
    {
      'icon': FontAwesomeIcons.planeUp,
      'name' : 'Travel'
    },
    {
      'icon': FontAwesomeIcons.trainSubway,
      'name' : 'Transport'
    },
    {
      'icon': FontAwesomeIcons.parachuteBox,
      'name': 'Other'
    },
  ].obs;

  void setShowInputSearch(bool show) {
    showInputSearch.value = show;
  }

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