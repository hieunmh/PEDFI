import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {

  var currentMonth = ''.obs;
  var month = [].obs;

  final scrollController = ScrollController();
  
  @override
  void onInit() {
    super.onInit();
    
    DateTime now = DateTime.now();

    for (int i = -23; i <= 0; i++) {
      month.add(DateFormat('MMM y').format(DateTime(now.year, now.month + i, 1)));
    }

    currentMonth.value = DateFormat('MMM y').format(now).toString();

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollToLast(Get.width);
    });
  }

  void setCurrentMonth(String month) {
    currentMonth.value = month;
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

    if (selectedMonth == 1) {
      scrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.ease
      );
    }
  }

  void scrollToLast(double screenWidth) {

    final lengthScroll = month.length;

    scrollController.animateTo(
      90.0 * lengthScroll - screenWidth, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.ease
    );
  }
}