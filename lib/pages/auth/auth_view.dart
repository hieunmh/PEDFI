import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/auth/auth_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/google_provider.dart';
import 'package:pedfi/widgets/text_field.dart';
import 'package:provider/provider.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Obx(() => Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: bgcolor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            }, 
            icon: const MyBackButton()
          ),
          leadingWidth: 80,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const Icon(Icons.android, size: 100),
      
                  Text(
                    controller.action.value == 'signin' ?
                    'Welcome to Pedfi' : 'Let\'s create an account for you!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: controller.action.value == 'signin' ? 40 : 20,
                      color: color
                    ), 
                  ),
      
                  controller.action.value == 'signin' ?
                  const SizedBox(height: 35) : const SizedBox(height: 20),
      
                  MyTextField(
                    hintText: 'Email', 
                    placeholder: 'example@gmail.com', 
                    obscureText: false, 
                    controller: controller.email
                  ),
      
                  const SizedBox(height: 10),
      
                  MyTextField(
                    hintText: 'Password', 
                    placeholder: '●●●●●●●●', 
                    obscureText: true, 
                    controller: controller.password
                  ),
      
                  if (controller.action.value == 'signup') MyTextField(
                    controller: controller.confirmPassword,
                    hintText: 'Confirm password', 
                    placeholder: '●●●●●●●●',
                    obscureText: true,
                  ),
      
                  if (controller.action.value == 'signin') Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: themeState.getDarkTheme ? 
                            Colors.grey[200] : Colors.grey[600]
                        ),
                      )
                    ]
                  ),
      
                  controller.action.value == 'signin' ?
                  const SizedBox(height: 35) : const SizedBox(height: 25),
      
                  TextButton(
                    style: ButtonStyle(
                      padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      controller.submitForm();
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
                          LoadingAnimationWidget.threeArchedCircle(
                          color: Colors.white, size: 26
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
                          if (controller.isLoading.value == true) {
                            return;
                          }
                          controller.toggleAuth();
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