import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomCategoryController extends GetxController {

  final DatabaseService databaseService = DatabaseService.instance;

  final supabase = Supabase.instance.client;
  
  var typecategory = 'income'.obs;

  var newCategory = TextEditingController();

  var selectIcon = 'beach.png'.obs;

  var appController = Get.find<ApplicationController>();


  void createOfflineCategory() async {

    // var category = Category(
    //   id: '8a433084-09e4-4cfe-b4a6-9b911a15df5f', 
    //   type: 'expense', 
    //   name: 'Beauty', 
    //   description: 'lam dep', 
    //   image: 'lipstick.png'
    // );

    // databaseService.createCategory(category);

    var res = await databaseService.getAllCategory();
    for (int i = 0; i < res.length; i++) {
      print(res[i].id);
      print(res[i].name);
      print(res[i].image);
    }
  }  


  Future<void> createCategory() async {
    if (newCategory.text.isEmpty) {
      print('Please fill all!');
      return;
    }

    var res = await supabase.from('Categories').upsert({
      'type': typecategory.value,
      'name': newCategory.text,
      'description': '',
      'priority': null,
      'image': selectIcon.value
    }).select().single();

    await appController.getAllCategory();

    Get.back(
      result: {
        'name': res['name'],
        'id': res['id']
      }
    );
  }
}