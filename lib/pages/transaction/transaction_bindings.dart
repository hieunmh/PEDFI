import 'package:get/get.dart';
import 'package:pedfi/pages/transaction/transaction_controller.dart';

class TransactionBindings extends Bindings {

  @override
  void dependencies() {
   Get.lazyPut(() => TransactionController());
  }
}