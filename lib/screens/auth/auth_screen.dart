import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/google_provider.dart';
import 'package:pedfi/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  String action = 'signin';
  bool isLoading = false;

  Future<void> submitForm() async {
    setState(() {
      isLoading = true;
    });

    if (action == 'signin') {
      await supabase.auth.signInWithPassword(
        email: email.text.trim(),
        password: password.text.trim()
      );
    } 
    
    else if (action == 'signup') {
      if (email.text == '' || password.text == '') {
          return;
        }

        await supabase.auth.signUp(
          email: email.text.trim(),
          password: password.text.trim()
        );
    }

    setState(() {
      isLoading = false;
    });
  }
  

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
            Navigator.pop(context);
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
                  action == 'signin' ?
                  'Welcome to Pedfi!' : 'Let \'s create an account for you!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: action == 'signin' ? 40 : 20,
                    color: color
                  ), 
                ),

                action == 'signin' ?
                const SizedBox(height: 35) : const SizedBox(height: 20),

                MyTextField(
                  controller: email,
                  hintText: 'Email', 
                  placeholder: 'example@gmail.com',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: password,
                  hintText: 'Password', 
                  placeholder: '●●●●●●●●',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                if (action == 'signup') MyTextField(
                  controller: confirmPassword,
                  hintText: 'Confirm password', 
                  placeholder: '●●●●●●●●',
                  obscureText: true,
                ),

                if (action == 'signin') Row(
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
                
                action == 'signin' ?
                const SizedBox(height: 35) : const SizedBox(height: 25),

                TextButton(
                  style: ButtonStyle(
                    padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    submitForm();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: themeState.getDarkTheme ?
                      const Color.fromRGBO(30, 30, 30, 1) : Colors.black,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: isLoading ? LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.white, size: 26
                      ) : Text(
                        action == 'signin' ? 'Sign in' : 'Sign up',
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
                      action == 'signin' ? 'Not a member?' : 'Already hava a account?',
                      style: TextStyle(
                        color: color
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        if (isLoading) {
                          return;
                        }
                        setState(() {
                          if (action == 'signin') {
                            action = 'signup';
                          } else if (action == 'signup') {
                             action = 'signin';
                          }
                        });
                      },
                      child: Text(
                        action == 'signin' ? 'Sign up now' : 'Sign in',
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
    );

  }
}