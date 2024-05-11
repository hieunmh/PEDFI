import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';

class CreateTranController extends GetxController {

  var pickedDateTime = ''.obs;

  var amountController = TextEditingController();
  var noteController = TextEditingController();
  
  void showDateTimePicker(BuildContext context, Color textColor) async {
    var dateTime = await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.date,
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
        DateTime.now().day - 1
      ).toString();

    } else {
      var dt = DateTime.parse(pickedDateTime.value);
      pickedDateTime.value = DateTime(
        dt.year, 
        dt.month , 
        dt.day - 1
      ).toString();
    }

  }

  void setNextDay() {
    if (pickedDateTime.value.isEmpty) {
      pickedDateTime.value = DateTime(
        DateTime.now().year, 
        DateTime.now().month, 
        DateTime.now().day + 1
      ).toString();

    } else {
      var dt = DateTime.parse(pickedDateTime.value);
      pickedDateTime.value = DateTime(
        dt.year, 
        dt.month , 
        dt.day + 1
      ).toString();
    }
  }
}