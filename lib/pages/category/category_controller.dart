import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {

  var showInputSearch = false.obs;

  var searchController = TextEditingController();

  void setShowInputSearch(bool show) {
    showInputSearch.value = show;
  }
}