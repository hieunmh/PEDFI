import 'package:get/get.dart';
import 'package:pedfi/pages/stock/market/market_controller.dart';
import 'package:pedfi/pages/stock/overview/overview_controller.dart';
import 'package:pedfi/pages/stock/stock_controller.dart';

class StockBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => StockController());
    Get.lazyPut(() => MarketController());
    Get.lazyPut(() => OverviewController());
  }
}