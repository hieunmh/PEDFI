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
    print(joinDate);
  }

  void setGender(String gender) {
    this.gender.value = gender;
  }


  void signOutUser() async {
    isLoading.value = true;

    await supabase.auth.signOut();

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