// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_bindings.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_view.dart';
import 'package:pedfi/pages/application/application_bindings.dart';
import 'package:pedfi/pages/application/application_view.dart';
import 'package:pedfi/pages/auth/auth_bindings.dart';
import 'package:pedfi/pages/auth/auth_view.dart';
import 'package:pedfi/routes/routes.dart';

class AppPages {
  
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION, 
      page: () => ApplicationPage(),
      binding: ApplicationBindings()
    ),

    GetPage(
      name: AppRoutes.AUTH, 
      page: () => AuthPage(),
      binding: AuthBindings()
    ),

    GetPage(
      name: AppRoutes.PROFILE_DETAIL, 
      page: () => ProfileDetailPage(),
      binding: ProfileDetailBindings()
    ),


  ];
}