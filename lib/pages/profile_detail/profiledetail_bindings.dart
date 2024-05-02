
import 'package:get/get.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_controller.dart';

class ProfileDetailBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileDetailController());
  }
}