import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pedfi/pages/application/create/create_tran_controller.dart';


class CategoryController extends GetxController {

  var categoryIcon = FontAwesomeIcons.solidCircleQuestion.obs;
  var categoryName = 'Select category'.obs;

  var incomeCategory = Get.find<CreateTranController>().incomeCategory;
  var expenseCategory = Get.find<CreateTranController>().expenseCategory;


}