
import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';


class ApplicationBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationController()); 
    Get.lazyPut(() => HomeController());
  }
}