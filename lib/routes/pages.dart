import 'package:get/get.dart';
import 'package:pedfi/routes/routes.dart';
import 'package:pedfi/screens/add_screen.dart';
import 'package:pedfi/screens/home/home_screen.dart';
import 'package:pedfi/screens/profile/profile_screen.dart';

class AppPages {
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.HOMESCREEN, 
      // ignore: prefer_const_constructors
      page: () => HomeScreen()
    ),

    GetPage(
      name: AppRoutes.ADDSCREEN, 
      // ignore: prefer_const_constructors
      page: () => AddScreen()
    ),

    GetPage(
      name: AppRoutes.PROFILESCREEN, 
      // ignore: prefer_const_constructors
      page: () => ProfileScreen()
    ),
  ];
}