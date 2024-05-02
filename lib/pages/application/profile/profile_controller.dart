import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      final formatter = DateFormat('MMMM yyyy');

      userEmail.value = email;
      joinDate.value = formatter.format(DateTime.parse(createdAt)).toString();
      isLoggedin.value = true;
    }
  }

}