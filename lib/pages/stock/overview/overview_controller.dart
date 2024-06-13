import 'package:get/get.dart';

class OverviewController extends GetxController {
  var showTotalBalance = false.obs;

  void setShowTotalBalance(bool show) {
    showTotalBalance.value = show;
  }
}