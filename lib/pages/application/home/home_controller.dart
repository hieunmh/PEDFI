import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/application_controller.dart';

class HomeController extends GetxController {


  
  var userEmail = ''.obs;

  var currentMonth = DateFormat('MM-y').format(DateTime.now()).obs;

  var month = [].obs;

  var firstDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month, 1)).toString().obs;
  var lastDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0)).toString().obs;

  final List transactionsData = [
    {
      'icon': FontAwesomeIcons.burger,
      'iconcolor': AppColor.expenseDarkColor,
      'name': 'Food',
      'detail': 'Dookki',
      'totalAmount': '-\$45.00',
      'date': 'Today',
      'color': AppColor.expenseDarkColor
    },
    {
      'icon': FontAwesomeIcons.dollarSign,
      'iconcolor': AppColor.incomeDarkColor,
      'name': 'Work',
      'detail': 'Salary',
      'totalAmount': '+\$2000.00',
      'date': 'Today',
      'color': AppColor.incomeDarkColor
    },
    {
      'icon': FontAwesomeIcons.burger,
      'iconcolor': AppColor.expenseDarkColor,
      'name': 'Food',
      'detail': 'Dookki',
      'totalAmount': '-\$45.00',
      'date': 'Today',
      'color': AppColor.expenseDarkColor
    },
    {
      'icon': FontAwesomeIcons.dollarSign,
      'iconcolor': AppColor.incomeDarkColor,
      'name': 'Work',
      'detail': 'Salary',
      'totalAmount': '+\$2000.00',
      'date': 'Today',
      'color': AppColor.incomeDarkColor
    },
    {
      'icon':FontAwesomeIcons.heartCircleBolt,
      'iconcolor': AppColor.expenseDarkColor,
      'name': 'Health',
      'detail': 'Hospital',
      'totalAmount': '-\$79.00',
      'date': 'Yesterday',
      'color': AppColor.expenseDarkColor
    },
    {
      'icon': FontAwesomeIcons.planeUp,
      'iconcolor': AppColor.expenseDarkColor,
      'name': 'Travel',
      'detail': 'Hai Phong food tour',
      'totalAmount': '-\$350.00',
      'date': 'Yesterday',
      'color': AppColor.expenseDarkColor
    },
  ].obs;

  final scrollController = ScrollController();

  var appController = Get.find<ApplicationController>();

  @override
  void onInit() {
    super.onInit();
    userEmail.value = appController.userEmail.value;

    DateTime now = DateTime.now();

    for (int i = -23; i <= 0; i++) {
      month.add(DateFormat('MM-y').format(DateTime(now.year, now.month + i, 1)));
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToLast();
    });

  }

  void deleteItem(index) {
    transactionsData.removeAt(index);
    update();
  }

  void setCurrentMonth(String month) {
    currentMonth.value = month;
  }

  void setFirstLastDay(String current) {

    final splitted = current.split('-');

    var intYear = int.parse(splitted[1]);
    var intMonth = int.parse(splitted[0]);

    firstDay.value = DateFormat('dd MMMM, y').format(DateTime(intYear, intMonth, 1)).toString();
    lastDay.value = DateFormat('dd MMMM, y').format(DateTime(intYear, intMonth + 1, 0)).toString();
  }

  void scrollToCurrentMonth() {

    final selectedMonth = month.indexOf(currentMonth.value);
    final maxItemPerScreen  = (Get.width / 90.0).round();

    if (selectedMonth >= (maxItemPerScreen / 2).round() && 
      selectedMonth < month.length - (maxItemPerScreen / 2).round()
    ) {
      final scrollOffset = (selectedMonth * 90.0) - Get.width / 2 + 45;
      scrollController.animateTo(
        scrollOffset, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth < (maxItemPerScreen / 2).round()) {
      scrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth >= month.length - (maxItemPerScreen / 2).round()) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }
  }

  void scrollToLast() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }


  void setUserEmail(String name) {
    userEmail.value = name;
  }
}