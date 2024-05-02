import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  var action = 'signin'.obs;
  var isLoading = false.obs;
  
  Future<void> submitForm() async {
    
    isLoading.value = true;
    
    if (action.value == 'signin') {
      await supabase.auth.signInWithPassword(
        email: email.text.trim(),
        password: password.text.trim()
      );

      // Get.off(const ProfilePage());
    } 
    
    else if (action.value == 'signup') {
      if (email.text == '' || password.text == '') {
        return;
      }

      await supabase.auth.signUp(
        email: email.text.trim(),
        password: password.text.trim()
      );
    }

    isLoading.value = false;
  }

  void toggleAuth() {
    if (action.value == 'signin') {
      action.value = 'signup';
    } else if (action.value == 'signup') {
      action.value = 'signin';
    }
  }
}