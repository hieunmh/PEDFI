import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/google_provider.dart';
import 'package:pedfi/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  Future<void> signUpNewUser() async {
    if (email.text == '' || password.text == '') {
      return;
    }

    await supabase.auth.signUp(
      email: email.text.trim(),
      password: password.text.trim()
    );
  }

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    return Scaffold(
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
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.android, size: 100),
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color
                  ), 
                ),

                const SizedBox(height: 20),

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

                MyTextField(
                  controller: confirmpassword,
                  hintText: 'Confirm password', 
                  placeholder: '●●●●●●●●',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                TextButton(
                  style: ButtonStyle(
                    padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    signUpNewUser();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: themeState.getDarkTheme ?
                      const Color.fromRGBO(30, 30, 30, 1) 
                      : Colors.black,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const GoogleProvider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already hava a account?',
                      style: TextStyle(
                        color: color
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                       Navigator.pop(context);
                      },
                      child: const Text(
                        'Login now',
                        style: TextStyle(
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