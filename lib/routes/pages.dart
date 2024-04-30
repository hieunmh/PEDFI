import 'package:get/get.dart';
import 'package:pedfi/pages/application/application_bindings.dart';
import 'package:pedfi/pages/application/application_view.dart';
import 'package:pedfi/routes/routes.dart';

class AppPages {
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.APPLICATION, 
      // ignore: prefer_const_constructors
      page: () => ApplicationPage(),
      binding: ApplicationBindings()
    ),
  ];
}