import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class CategoryController extends GetxController {

  final supabase = Supabase.instance.client;
  final DatabaseService databaseService = DatabaseService.instance;

  var categoryIcon = FontAwesomeIcons.solidCircleQuestion.obs;
  var categoryName = 'Select category'.obs;

  var appController = Get.find<ApplicationController>();
  var homeController = Get.find<HomeController>();

  Future<void> deleteCategory(String id) async {

    await databaseService.deleteCategoryById(id);

    // if (homeController.isOnline.value && appController.userId.isNotEmpty) {
    //   await supabase.from('Categories').delete().eq('id', id);
    // }

    await appController.getAllCategory();
  }

}