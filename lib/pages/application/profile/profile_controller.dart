import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {

  var supabase = Supabase.instance.client;
  

  var appController = Get.find<ApplicationController>();

  var userEmail = Get.find<ApplicationController>().userEmail;
  var joinDate = Get.find<ApplicationController>().joinDate;
  var userId = Get.find<ApplicationController>().userId;
  var isLoggedin = Get.find<ApplicationController>().isLoggedin;

}