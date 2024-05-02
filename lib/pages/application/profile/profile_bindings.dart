import 'package:get/get.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';

class ProfileBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController()); 
  }
}