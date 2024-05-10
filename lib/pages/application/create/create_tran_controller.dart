import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';

class CreateTranController extends GetxController {


  var pickedDateTime = 'datetime'.obs;
  
  void showDateTimePicker(BuildContext context, Color textColor) async {
    await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.date,
      initialDate: DateTime.now(),
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
    ).then((datetime) => pickedDateTime.value = datetime.toString());



  }
}