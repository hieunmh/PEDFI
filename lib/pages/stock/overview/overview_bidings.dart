import 'package:get/get.dart';
import 'package:pedfi/pages/stock/overview/overview_controller.dart';

class OverviewBidings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => OverviewController());
  }
}