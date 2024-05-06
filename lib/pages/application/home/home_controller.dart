import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';

class HomeController extends GetxController {
  
  var userEmail = ''.obs;

  var appController = Get.find<ApplicationController>();

  @override
  void onInit() {
    super.onInit();
    userEmail.value = appController.userEmail.value;
  }

  void setUserEmail(String name) {
    userEmail.value = name;
  }
}