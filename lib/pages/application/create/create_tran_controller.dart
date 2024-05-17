import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:pedfi/pages/application/application_controller.dart';
import 'package:pedfi/pages/application/calendar/calendar_controller.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/profile/profile_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateTranController extends GetxController {

  final supabase = Supabase.instance.client;

  var pickedDateTime = DateTime.now().toString().obs;

  var amountController = TextEditingController();
  var noteController = TextEditingController();


  var trantype = 'income'.obs;
  var isLoading = false.obs;

  var selectCategory = ''.obs;
  var selectCateId = ''.obs;

  var allCategory = <Category>[].obs;

  var incomeCategory = <Category>[].obs;
  var expenseCategory = <Category>[].obs;


  var userId = Get.find<ProfileController>().userId;

  var homeController = Get.find<HomeController>();
  var appController= Get.find<ApplicationController>();
  var calendarController = Get.find<CalendarController>();

  @override
  void onInit() {
    super.onInit();
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    final res = await supabase.from('Categories').select('*');
    allCategory.value = categoryFromJson(res);
    incomeCategory.value = allCategory.where((item) => item.type == 'income').toList();
    expenseCategory.value = allCategory.where((item) => item.type == 'expense').toList();
  }
  
  Future<void> createTransaction() async {
    if (amountController.text.isEmpty || noteController.text.isEmpty || selectCategory.value.isEmpty || userId.isEmpty) {
      print('Please fill all!');
      return;
    }

    isLoading.value = true;

    var insertValue = trantype.value == 'income' ? int.parse(amountController.text.replaceAll(',', '')) : 
      -1 * int.parse(amountController.text.replaceAll(',', ''));

    var financewallet = await supabase.from('Wallets').select('*').eq('user_id', userId.value).eq('name', 'finance');


    await supabase.from('Wallets').upsert({
      'id': userId.value,
      'name': 'finance',
      'user_id': userId.value,
      'value': financewallet.isNotEmpty ? financewallet[0]['value'] + insertValue
        : int.parse(amountController.text.replaceAll(',', '')),
      'created_at': pickedDateTime.value
    });

    await supabase.from('Transactions').insert({
      'description': noteController.text,
      'date': pickedDateTime.value,
      'value': insertValue,
      'is_notified': false,
      'user_id': userId.value,
      'category_id': selectCateId.value,
      'wallet_id': userId.value
    });

    isLoading.value = false;
    
    await homeController.getAllTransaction();
    
    appController.handleNavBarTap(0);
    calendarController.filterTranFunc();

    resetForm();

  }

  void resetForm() {
    trantype.value = 'income';
    pickedDateTime.value = DateTime.now().toString();
    amountController.text = '';
    noteController.text = '';
    selectCategory.value = '';
    selectCateId.value = '';
  }

  void setSelectCategory(String select, String id) {
    selectCategory.value = select;
    selectCateId.value = id;
  }

  void toggleTranType() {
    if (trantype.value == 'income') {
      trantype.value = 'expense';
    } else if (trantype.value == 'expense') {
      trantype.value = 'income';
    }
  }
  
  void showDateTimePicker(BuildContext context, Color textColor) async {
    var dateTime = await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.date,
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
          year: 'Year',
          month: 'Month',
          day: 'Day',
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