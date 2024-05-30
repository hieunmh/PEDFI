import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:pedfi/provider/dark_theme_provider.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:pedfi/widgets/profile/foward_button.dart';
import 'package:provider/provider.dart';

class ProfileAvatar extends GetView<ProfileController> {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? 
    AppColor.textDarkThemeColor : AppColor.textLightThemeColor;

    final formatter = DateFormat('MMMM yyyy');

    return Obx(() =>
      SizedBox(
        child: controller.isLoggedin.value ? (
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/meo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userEmail.value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: color
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Join ${formatter.format(DateTime.parse(controller.joinDate.value)).toString()}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              const Spacer(),
              ForwardButton(
                onTap: () async {
                  var data = await Get.toNamed(
                    AppRoutes.PROFILE_DETAIL,
                    parameters: {
                      'userEmail': controller.userEmail.value,
                      'joinDate': controller.joinDate.value
                    }
                  );
      
                  if (data == null) {
                    return;
                  } else {
                    controller.userEmail.value = '';
                    controller.joinDate.value = '';
                    controller.isLoggedin.value = false;
                  }
                  
                }
              )
            ],
          )
        ) : (
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/placeholder.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in | Sign up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: color
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Sign in to sync your data',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              const Spacer(),
              ForwardButton(
                onTap: () async {
                  var data = await Get.toNamed(AppRoutes.AUTH);
                  if (data == null) {
                    return;
                  }
                  controller.isLoggedin.value = data['isLoggedIn'];
                  controller.userEmail.value = data['userEmail'] ?? '';
                  controller.joinDate.value = data['joinDate'] ?? '';
                  controller.userId.value = data['userId'] ?? '';
                }
              )
            ],
          )
        )
      ),
    );
  }
}