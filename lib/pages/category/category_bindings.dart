import 'package:get/get.dart';
import 'package:pedfi/pages/category/category_controller.dart';

class CategoryBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}