import 'package:get/get.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDetailController extends GetxController {
  
  final supabase = Supabase.instance.client;

  var gender = 'male'.obs;
  var isLoading = false.obs;

  late String userEmail;
  late String joinDate;

  var homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    super.onInit();
    userEmail = Get.parameters['userEmail'] ?? '';
    joinDate = Get.parameters['joinDate'] ?? '';
  }

  void setGender(String gender) {
    this.gender.value = gender;
  }


  void signOutUser() async {
    isLoading.value = true;

    await supabase.auth.signOut();
    homeController.setUserEmail('Sign in');

    Get.back(
      result: {
        'userEmail': '',
        'joinDate': '',
        'isLoggedIn': false
      }
    );

    isLoading.value = false;
  }
}