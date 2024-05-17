import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomCategoryController extends GetxController {

  final supabase = Supabase.instance.client;
  
  var typecategory = 'income'.obs;

  var newCategory = TextEditingController();

  var selectIcon = 'beach.png'.obs;

  var createTranController = Get.find<CreateTranController>();


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

    await createTranController.getAllCategory();
    print(res);

    Get.back(
      result: {
        'name': res['name'],
        'id': res['id']
      }
    );
  }
}