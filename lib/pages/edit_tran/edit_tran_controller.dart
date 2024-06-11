import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/database/database_service.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditTransactionController extends GetxController {

  final supabase = Supabase.instance.client;
  final DatabaseService databaseService = DatabaseService.instance;

  var argumentData = Get.arguments;
  var trantype = ''.obs;
  var pickedDateTime = Get.arguments['date'].toString().obs;

  var selectCategory = ''.obs;
  var selectCateId = Get.arguments['category_id'].toString().obs;
  var selectCateImage = ''.obs;
  var isLoading = false.obs;
  
  var amountController = TextEditingController(text: NumberFormat.currency(
    decimalDigits: 0,
    symbol: ''
  ).format(Get.arguments['value'].abs()));

  var noteController = TextEditingController(text: Get.arguments['description']);

  var appController = Get.find<ApplicationController>();
  var homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    trantype.value = Get.arguments['value'] > 0  ? 'income' : 'expense';
  }

  Future<void> editTransaction() async {
    isLoading.value = true;

    final id = Get.arguments['id'];
    final oldvalue = Get.arguments['value'];

    var insertValue = trantype.value == 'income' ? int.parse(amountController.text.replaceAll(',', '')) : 
        -1 * int.parse(amountController.text.replaceAll(',', ''));

    await supabase.from('Wallets').update({
      'value': homeController.expenseMonthValue() + homeController.incomeMonthValue() - oldvalue + insertValue
    }).eq('id', appController.userId.value);

    await supabase.from('Transactions').update({
      'description': noteController.text,
      'date': pickedDateTime.value,
      'value': insertValue,
      'is_notified': false,
    }).eq('id', id);

    await homeController.getOnlineAllTransaction();

    isLoading.value = false;
    Get.back();
  }

  void showDateTimePicker(BuildContext context, Color textColor) async {
    var dateTime = await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.datetime,
      minimumDate: DateTime(1000),
      maximumDate: DateTime.now(),
      initialDate: pickedDateTime.value.isEmpty ? 
      DateTime.now() : DateTime.parse(pickedDateTime.value),
      radius: 0,
      options: BoardDateTimeOptions(
        activeColor: AppColor.commonColor,
        textColor: textColor,
        pickerFormat: PickerFormat.ymd,
        startDayOfWeek: DateTime.monday,
        boardTitle: 'Choose date',
        pickerSubTitles: const BoardDateTimeItemTitles(
          year: 'year',
          month: 'month',
          day: 'day',
          hour: 'hour',
          minute: 'min'
        ),
      )
    );

    if (dateTime == null) {
      if (pickedDateTime.value.isEmpty) {
        pickedDateTime.value = DateTime.now().toString();
      }
      return;
    } else {
      pickedDateTime.value = dateTime.toString();
    }
  }

  void setSelectCategory(String select, String id, String image) {
    selectCategory.value = select;
    selectCateId.value = id;
    selectCateImage.value = image;
  }

  void setPreviousDay() {
    if (pickedDateTime.value.isEmpty) {
      pickedDateTime.value = DateTime(
        DateTime.now().year, 
        DateTime.now().month, 
        DateTime.now().day - 1,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
      ).toString();

    } else {
      var dt = DateTime.parse(pickedDateTime.value);
      pickedDateTime.value = DateTime(
        dt.year, 
        dt.month , 
        dt.day - 1,
        dt.hour,
        dt.minute,
        dt.second
      ).toString();
    }

  }

  void setNextDay() {
    if (pickedDateTime.value.isEmpty) {
      pickedDateTime.value = DateTime(
        DateTime.now().year, 
        DateTime.now().month, 
        DateTime.now().day + 1,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
      ).toString();

    } else {
      var dt = DateTime.parse(pickedDateTime.value);
      pickedDateTime.value = DateTime(
        dt.year, 
        dt.month , 
        dt.day + 1,
        dt.hour,
        dt.minute,
        dt.second
      ).toString();
    }
  }
}