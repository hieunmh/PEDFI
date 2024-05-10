import 'package:get/get.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';

class CreateBidings extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTranController());
  }
}