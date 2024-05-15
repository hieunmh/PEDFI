import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = Supabase.instance.client;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  var action = 'signin'.obs;
  var isLoading = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var passwordConfirmError = ''.obs;
  var serverError = ''.obs;

  
  Future<void> handleSignIn() async {

    if (emailController.text.isEmpty) {
      emailError.value = 'Please enter your email';
      return;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
        emailError.value = 'Please enter a valid email';
        return;
    } else {
      emailError.value = '';
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = 'Please enter your password';
      return;
    } else if (passwordController.text.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      
    } else {
      passwordError.value = '';
    }

    isLoading.value = true;

    try {
      await supabase.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text
      );

    } catch (e) {
      serverError.value = 'Wrong email or password';
      isLoading.value = false;
      return;
    }

    isLoading.value = false;

    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();
    var id = supabase.auth.currentUser?.id.toString();

    if (email == null || createdAt == null) {
      return;
    } else {
      Get.back(
        result: {
          'userId': id,
          'isLoggedIn': true,
          'userEmail': email,
          'joinDate': createdAt
        }
      );
    }
  }

  Future<void> handleSignUp() async {

    if (emailController.text.isEmpty) {
      emailError.value = 'Please enter your email';
      return;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailController.text)) {
        emailError.value = 'Please enter a valid email';
        return;
    } else {
      emailError.value = '';
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = 'Please enter your password';
      passwordConfirmError.value = '';
      return;
    } else if (passwordController.text.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      passwordConfirmError.value = '';
      return;
      
    } else {
      passwordError.value = '';
    }

    if (passwordConfirmController.text.isEmpty) {
      passwordConfirmError.value = 'Please enter confirm password';
      return;
    } else if (passwordConfirmController.text != passwordController.text) {
      passwordConfirmError.value = 'Confirm password does not match';
      return;
    } else {
      passwordConfirmError.value = '';
    }

    isLoading.value = true;

    try {
      await supabase.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
  
    } catch (e) {
      serverError.value = 'This email has been registered';
      isLoading.value = false;
    }

    isLoading.value = false;

    var email = supabase.auth.currentUser?.email.toString();
    var createdAt = supabase.auth.currentUser?.createdAt.toString();

    if (email == null || createdAt == null) {
      return;
    } else {
      Get.back(
        result: {
          'isLoggedIn': true,
          'userEmail': email,
          'joinDate': createdAt
        }
      );
    }
  }

  void toggleAction() {
    emailController.text = '';
    passwordController.text = '';
    passwordConfirmController.text = '';

    emailError.value = '';
    passwordError.value = '';
    passwordConfirmError.value = '';

    serverError.value = '';
    if (action.value == 'signin') {
      action.value = 'signup';
    } else {
      action.value = 'signin';
    }
  }

}