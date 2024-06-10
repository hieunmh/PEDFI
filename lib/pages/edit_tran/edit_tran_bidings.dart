import 'package:get/get.dart';
import 'package:pedfi/pages/edit_tran/edit_tran_controller.dart';

class EditTranSactionBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTransactionController());
  }
  
}