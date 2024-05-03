import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  var action = 'signin'.obs;
  var isLoading = false.obs;
  
  Future<void> handleSignIn(String email, String password) async {

    isLoading.value = true;
    
    var data = await supabase.auth.signInWithPassword(
      email: email,
      password: password
    );

    final formatter = DateFormat('MMMM yyyy');
    
    Get.back(
      result: {
        'isLoggedIn': true,
        'userEmail': data.user!.email,
        'joinDate': formatter.format(DateTime.parse(data.user!.createdAt)).toString()
      }
    );

    isLoading.value = false;
  }



  void toggleAction() {
    if (action.value == 'signin') {
      action.value = 'signup';
    } else {
      action.value = 'signin';
    }
  }
}