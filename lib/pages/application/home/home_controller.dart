import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/pages/application/application_controller.dart';

class HomeController extends GetxController {
  
  var userEmail = ''.obs;

  var currentMonth = DateFormat('MM-y').format(DateTime.now()).obs;

  var month = [].obs;

  var firstDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month, 1)).toString().obs;
  var lastDay = DateFormat('dd MMMM, y').format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0)).toString().obs;

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

  void setCurrentMonth(String month) {
    currentMonth.value = month;
  }

  void setFirstLastDay(String current) {

    final splitted = current.split('-');

    var intYear = int.parse(splitted[1]);
    var intMonth = int.parse(splitted[0]);

    firstDay.value = DateFormat('dd MMMM, y').format(DateTime(intYear, intMonth, 1)).toString();
    lastDay.value = DateFormat('dd MMM, y').format(DateTime(intYear, intMonth + 1, 0)).toString();
  }

  void scrollToCurrentMonth() {
    final selectedMonth = month.indexOf(currentMonth.value);
    if (selectedMonth >= 2 && selectedMonth <= month.length - 3) {
      final scrollOffset = (selectedMonth * 90.0) - Get.width / 2 + 45;
      scrollController.animateTo(
        scrollOffset, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth == 1 || selectedMonth == 0) {
      scrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }

    if (selectedMonth > month.length - 3) {
      
      scrollController.animateTo(
        scrollController.position.maxScrollExtent, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }
  }

  void scrollToLast() {

    final lengthScroll = month.length;

    scrollController.animateTo(
      90.0 * lengthScroll - Get.width, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.ease
    );
  }


  void setUserEmail(String name) {
    userEmail.value = name;
  }
}