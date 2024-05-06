import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {

  var supabase = Supabase.instance.client;
  
  var userEmail = ''.obs;
  var joinDate = ''.obs;
  var isLoggedin = false.obs;

  var appController = Get.find<ApplicationController>();

  @override
  void onInit() {
    super.onInit();
    
    userEmail.value = appController.userEmail.value;
    joinDate.value = appController.joinDate.value;
    isLoggedin.value = appController.isLoggedin.value;
  }

}