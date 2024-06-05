import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomCategoryController extends GetxController {

  final DatabaseService databaseService = DatabaseService.instance;

  final supabase = Supabase.instance.client;
  
  var typecategory = 'income'.obs;

  var newCategory = TextEditingController();

  var selectIcon = 'beach.png'.obs;

  var appController = Get.find<ApplicationController>();
  var homeController = Get.find<HomeController>();



  Future<void> createCategory(String id) async {    
    if (newCategory.text.isEmpty) {
      print('Please fill all!');
      return;
    }

    var category = Category(
      id: id, 
      type: typecategory.value, 
      name: newCategory.text, 
      image: selectIcon.value
    );

    databaseService.createCategory(category);

    if (homeController.isOnline.value) {
      var res = await supabase.from('Categories').upsert({
        'id': id,
        'type': typecategory.value,
        'name': newCategory.text,
        'priority': null,
        'image': selectIcon.value
      }).select().single();
      
      Get.back(
        result: {
          'name': res['name'],
          'id': res['id']
        }
      );
    }

    await appController.getAllCategory();
  }
}