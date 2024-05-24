import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class CustomCategoryController extends GetxController {

  final DatabaseService databaseService = DatabaseService.instance;

  final supabase = Supabase.instance.client;
  
  var typecategory = 'income'.obs;

  var newCategory = TextEditingController();

  var selectIcon = 'beach.png'.obs;

  var appController = Get.find<ApplicationController>();


  void createOfflineCategory() async {

    var uuid = const Uuid().v4();

    var category = Category(
      id: uuid, 
      type: typecategory.value, 
      name: newCategory.text, 
      description: '', 
      image: selectIcon.value
    );

    databaseService.createCategory(category);

    await appController.getAllCategory();
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