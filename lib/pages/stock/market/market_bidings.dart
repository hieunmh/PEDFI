import 'package:get/get.dart';
import 'package:pedfi/pages/stock/market/market_controller.dart';

class MarketBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MarketController());
  }

  
}