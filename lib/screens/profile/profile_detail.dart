import 'package:flutter/material.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:pedfi/widgets/profile/edit_item.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {

  String gender = 'male';

  Future<void> signOutUser() async {
    await supabase.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
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
        centerTitle: true,
        title: Text(
          'Profile detail',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              EditItem(
                title: 'Profile picture',
                widget: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/meo.jpg', width: 40, height: 40
                  ),
                ),
              ),

              EditItem(
                title: 'Name',
                widget: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Text(
                    'Nguyen Minh Hieu',
                    style: TextStyle(
                      color: Colors.grey[600]
                    ),
                  )
                ),
              ),

              EditItem(
                title: 'Gender',
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: gender == 'male'
                            ? const Color.fromRGBO(2, 176, 240, 1)
                            : themeState.getDarkTheme ? Colors.white10 : Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.male_rounded,
                          color: gender == 'male' ? Colors.white : 
                          themeState.getDarkTheme ? Colors.white : Colors.black,
                          size: 25,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: gender == 'female'
                            ? const Color.fromRGBO(247, 91, 149, 1)
                            : themeState.getDarkTheme ? Colors.white10 : Colors.black12,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(
                          Icons.female_rounded,
                          color: gender == 'female' ? Colors.white : 
                          themeState.getDarkTheme ? Colors.white : Colors.black,
                          size: 25,
                        ),
                      ),
                    ),

                  ],
                )
              ),

              const SizedBox(height: 40),

              TextButton(
                style: ButtonStyle(
                  padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(30)),
                ),
                onPressed: () {
                  signOutUser();
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
                      'Sign out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}