import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockController extends GetxController {
  final state = 0.obs;

  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.value);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handlePageChange(int index) {
    log('Page changed to $index', name: 'Page Change');
    state.value = index;
  }

  void handleNavBarTap(int index) {
    log('Navigating to page $index', name: 'Navigation');
    pageController.jumpToPage(index);
  }
}
