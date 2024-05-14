import 'package:get/get.dart';
import 'package:pedfi/pages/custom_categogy/custom_controller.dart';

class CustomCategoryBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CustomCategoryController());
  }
}