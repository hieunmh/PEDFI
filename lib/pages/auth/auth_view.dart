// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/auth/auth_controller.dart';
import 'package:pedfi/pages/auth/text_input.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/google_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends GetView<AuthController> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();


  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          onPressed: () {
            Get.back(
              result: {
                'isLoggedIn': false,
                'userEmail': '',
                'joinDate': ''
              }
            );
          }, 
          icon: const MyBackButton()
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Obx(() =>
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/pf.png', width: 150, height: 60)
                    ],
                  ),
              
                  Text(
                    controller.action.value == 'signin' ? 
                    'Welcome back!' : 'Let\'s create an account for you!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: controller.action.value == 'signin' ? 40 : 20
                    ),
                  ),
              
                  controller.action.value == 'signin' ? 
                  const SizedBox(height: 45) : const SizedBox(height: 20),
                  
                  TextInput(
                    hintText: 'Email', 
                    placeholder: 'example@gmail.com',
                    obscureText: false, 
                    ctrler: emailController
                  ),
                  
                  const SizedBox(height: 10),
              
                  TextInput(
                    hintText: 'Password', 
                    placeholder: '••••••••',
                    obscureText: true, 
                    ctrler: passwordController
                  ),
              
                  controller.action.value == 'signup' ? 
                  const SizedBox(height: 10) : const SizedBox(height: 0),
              
                  controller.action.value == 'signup' ? TextInput(
                    hintText: 'Confirm password', 
                    placeholder: '••••••••',
                    obscureText: true, 
                    ctrler: confirmPasswordController
                  ) : const SizedBox(height: 0),

                  controller.action.value == 'signin' ?
                  const SizedBox(height: 5) : const SizedBox(height: 0),
                  
                  controller.action.value == 'signin' ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: themeState.getDarkTheme ? 
                            Colors.grey[200] : Colors.grey[600], 
                        ),
                      )
                    ]
                  ) : const SizedBox(height: 0),
                  
                  controller.action.value == 'signin' ?
                  const SizedBox(height: 30) : const SizedBox(height: 25),
                  
                  TextButton(
                    style: ButtonStyle(
                      padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      if (controller.action.value == 'signin') {
                        controller.handleSignIn(
                          emailController.text.trim(), 
                          passwordController.text.trim()
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: themeState.getDarkTheme ?
                        const Color.fromRGBO(30, 30, 30, 1) : Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: controller.isLoading.value ? 
                        LoadingAnimationWidget.dotsTriangle(
                          color: Colors.white, 
                          size: 26
                        ) : Text(
                          controller.action.value == 'signin' ? 'Sign in' : 'Sign up',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  const GoogleProvider(),
                              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.action.value == 'signin' 
                        ? 'Not a member?' : 'Already hava a account?',
                        style: TextStyle(
                          color: color
                        ),
                      ),
                      const SizedBox(width: 4),
                  
                      GestureDetector(
                        onTap: () {
                          controller.toggleAction();
                        },
                        child: Text(
                          controller.action.value == 'signin' 
                          ? 'Sign up now' : 'Sign in',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}