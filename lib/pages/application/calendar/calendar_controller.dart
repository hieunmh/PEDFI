import 'package:get/get.dart';
import 'package:pedfi/model/transaction_model.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  
  var selectedDay = DateTime.now().obs;

  var calendarFormat = CalendarFormat.month.obs;

  var allTransaction = Get.find<HomeController>().allTransaction;

  var filterTransaction = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterTranFunc();
  }

  void filterTranFunc() {
    int day = selectedDay.value.day;
    int month = selectedDay.value.month;
    int year = selectedDay.value.year;

    filterTransaction.value = allTransaction.where((e) {
      return DateTime.parse(e.date).year == year 
      && DateTime.parse(e.date).month == month
      && DateTime.parse(e.date).day == day;
    }).toList();

  }

  void setSelectedDay(DateTime day) {
    selectedDay.value = day;
    filterTranFunc();
  }

  void changedFormat(CalendarFormat format) {
    calendarFormat.value = format;
  }
}