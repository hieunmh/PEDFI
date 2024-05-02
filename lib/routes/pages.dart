import 'package:get/get.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_bindings.dart';
import 'package:pedfi/pages/profile_detail/profiledetail_view.dart';
import 'package:pedfi/pages/application/application_bindings.dart';
import 'package:pedfi/pages/application/application_view.dart';
import 'package:pedfi/pages/auth/auth_bindings.dart';
import 'package:pedfi/pages/auth/auth_view.dart';
import 'package:pedfi/routes/routes.dart';

class AppPages {
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION, 
      page: () => const ApplicationPage(),
      binding: ApplicationBindings()
    ),

    GetPage(
      name: AppRoutes.AUTH, 
      page: () => const AuthPage(),
      binding: AuthBindings()
    ),

    GetPage(
      name: AppRoutes.PROFILE_DETAIL, 
      page: () => const ProfileDetailPage(),
      binding: ProfileDetailBindings()
    ),

  ];
}