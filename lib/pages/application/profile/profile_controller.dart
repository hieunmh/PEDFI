import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {

  var supabase = Supabase.instance.client;
  
  var userEmail = ''.obs;
  var joinDate = ''.obs;
  var isLoggedin = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();

    if (email == null || createdAt == null) {
      return;
    } else {
      userEmail.value = email;
      joinDate.value = createdAt;
      isLoggedin.value = true;
    }
  }

}