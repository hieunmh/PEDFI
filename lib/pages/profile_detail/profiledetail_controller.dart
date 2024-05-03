// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDetailController extends GetxController {
  
  final supabase = Supabase.instance.client;

  var gender = 'male'.obs;
  var isLoading = false.obs;

  late String userEmail;
  late String joinDate;

  @override
  void onInit() async {
    super.onInit();
    userEmail = Get.parameters['userEmail'] ?? '';
    joinDate = Get.parameters['joinDate'] ?? '';
  }

  void setGender(String gender) {
    this.gender.value = gender;
  }


  void signOutUser(BuildContext context) async {
    isLoading.value = true;

    await supabase.auth.signOut();

    isLoading.value = false;

    // Get.offAll(const ApplicationPage());
  }
}