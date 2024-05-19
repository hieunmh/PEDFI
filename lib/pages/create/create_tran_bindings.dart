import 'package:get/get.dart';
import 'package:pedfi/pages/create/create_tran_controller.dart';

class CreateTranBidings extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTranController());
  }
}