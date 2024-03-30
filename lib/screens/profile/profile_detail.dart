import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/edit_item.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {

  String gender = 'male';

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color bgcolor = themeState.getDarkTheme ? Colors.black87 : Colors.white70;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black87;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: color,
            size: 30,
          )
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fixedSize: const Size(50, 50),
                elevation: 10,
              ),
              icon:const Icon(
                CupertinoIcons.checkmark_alt, color: Colors.white
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  color: color,
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/meo.jpg', width: 100, height: 100
                      ),
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text(
                        'Upload image',
                        style: TextStyle(
                          color: color
                        ),
                      )
                    )
                  ],
                ),
              ),
              EditItem(
                title: 'Name',
                widget: TextField(
                  style: TextStyle(
                    color: color
                  ),
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: 'Gender',
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == 'male'
                            ? const Color.fromRGBO(2, 176, 240, 1)
                            : themeState.getDarkTheme ? Colors.white24 : Colors.black12,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.male_rounded,
                        color: gender == "male" ? Colors.white
                         : themeState.getDarkTheme ? Colors.white : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == 'female'
                            ? const Color.fromRGBO(247, 91, 149, 1)
                            : themeState.getDarkTheme ? Colors.white24 : Colors.black12,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Icons.female,
                        color: gender == 'female' ? Colors.white : 
                        themeState.getDarkTheme ? Colors.white : Colors.black,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: TextField(
                  style: TextStyle(
                    color: color
                  ),
                ),
                title: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}