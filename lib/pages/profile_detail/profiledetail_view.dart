import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/profile_detail/edit_item.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/widgets/back_button.dart';
import 'package:provider/provider.dart';

class ProfileDetailPage extends GetView<ProfileDetailController> {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;
    
    final Color bgcolor = themeState.getDarkTheme ? 
    AppColor.bgDarkThemeColor : AppColor.bgLightThemeColor;

    final formatter = DateFormat('EEEE, dd/MM/yyyy');

    return Obx(() => Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: bgcolor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            }, 
            icon: MyBackButton(buttonColor: color)
          ),
          leadingWidth: 80,
          centerTitle: true,
          title: Text(
            'Profile detail',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 18
            ),
          )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Center(
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
                    title: 'Email',
                    widget: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        controller.userEmail,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ),
                  ),

                  EditItem(
                    title: 'Join date',
                    widget: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        formatter.format(DateTime.parse(controller.joinDate)),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500
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
                            controller.setGender('male');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: controller.gender.value == 'male'
                                ? const Color.fromRGBO(2, 176, 240, 1)
                                : themeState.getDarkTheme ? Colors.white10 : Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.male_rounded,
                              color: controller.gender.value == 'male' ? Colors.white : 
                              themeState.getDarkTheme ? Colors.white : Colors.black,
                              size: 25,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {
                            controller.setGender('female');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: controller.gender.value == 'female'
                                ? const Color.fromRGBO(247, 91, 149, 1)
                                : themeState.getDarkTheme ? Colors.white10 : Colors.black12,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(
                              Icons.female_rounded,
                              color: controller.gender.value == 'female' ? Colors.white : 
                              themeState.getDarkTheme ? Colors.white : Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    )
                  ),

                  const SizedBox(height: 40),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      style: ButtonStyle(
                        padding:MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                      ),
                      onPressed: () {
                        controller.signOutUser();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: themeState.getDarkTheme ?
                          const Color.fromRGBO(30, 30, 30, 1) 
                          : Colors.black,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child:  Center(
                          child: controller.isLoading.value ? LoadingAnimationWidget.fallingDot(
                            color: Colors.white, size: 26) : const Text(
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
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}