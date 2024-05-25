import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class CategoryController extends GetxController {

  final supabase = Supabase.instance.client;
  final DatabaseService databaseService = DatabaseService.instance;

  var categoryIcon = FontAwesomeIcons.solidCircleQuestion.obs;
  var categoryName = 'Select category'.obs;

  var appController = Get.find<ApplicationController>();

  Future<void> deleteCategory(String id) async {

    await supabase.from('Categories').delete().eq('id', id);
    await databaseService.deleteCategoryById(id);

    await appController.getAllCategory();
  }

}