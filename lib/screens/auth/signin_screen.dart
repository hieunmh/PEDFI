import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/screens/auth/signup_screen.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/google_provider.dart';
import 'package:pedfi/widgets/text_field.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final email = TextEditingController();
  final password = TextEditingController();

  void signIn() async {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  email.text,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                ),
                Text(
                  password.text,
                  style: const TextStyle(
                    color: Colors.black
                  ),
                )
              ],
            ),
          ),
        );
      }
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
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.android, size: 100),
                Text(
                  'Welcome to Pedfi!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: color
                  ), 
                ),

                const SizedBox(height: 30),

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

                Row(
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
                
                const SizedBox(height: 25),

                TextButton(
                  style: ButtonStyle(
                    padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    signIn();
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
                        'Sign in',
                        style: TextStyle(
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
                      'Not a member?',
                      style: TextStyle(
                        color: color
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen() 
                          )
                        );
                      },
                      child: const Text(
                        'Register now',
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