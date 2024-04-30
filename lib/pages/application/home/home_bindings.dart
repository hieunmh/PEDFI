
import 'package:get/get.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
