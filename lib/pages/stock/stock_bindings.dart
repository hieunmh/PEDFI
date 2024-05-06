import 'package:get/get.dart';
import 'package:pedfi/pages/stock/stock_controller.dart';

class StockBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => StockController());
  }
}