import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedfi/consts/app_color.dart';
import 'package:pedfi/model/transaction_model.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/report/price_point.dart';
import 'package:collection/collection.dart';
import 'package:quiver/time.dart';

class ReportController extends GetxController {


  var pricePoint =<PricePoint>[].obs;

  var reporttype = 'income'.obs;

  var rankingTransaction = <Transaction>[].obs;

  var homeController = Get.find<HomeController>();

  var firstDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1
  ).obs;

  var data = <double>[].obs;
  var dateInMonth = daysInMonth(DateTime.now().year, DateTime.now().month).obs;
  

  @override
  void onInit() {
    super.onInit();
    setIncomeTransactionByDay(firstDay.value);
  }  


  void showDateTimePicker(BuildContext context, Color textColor) async {
    var dateTime = await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.date,
      minimumDate: DateTime(1000),
      maximumDate: DateTime.now(),
      initialDate: firstDay.value,
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
        ),
      )
    );

    if (dateTime == null) {
      return;
    } else {
      firstDay.value = dateTime;
      if (reporttype.value == 'income') {
        setIncomeTransactionByDay(firstDay.value);
      } else {
        setExpenseTransactionByDay(firstDay.value);
      }
    }
  }

  void setExpenseTransactionByDay(DateTime dt) {

    data.value = [];

    dateInMonth.value = daysInMonth(dt.year, dt.month);

    for (int i = 0; i < dateInMonth.value; i++) {
      var expenselist = homeController.allTransaction.where(
        (tran) => 
        DateTime.parse(tran.date).day == dt.day + i && 
        DateTime.parse(tran.date).month == dt.month && 
        DateTime.parse(tran.date).year == dt.year && 
        tran.value < 0
      ).toList();

      var value = 0.0;
      for (int i = 0; i < expenselist.length; i++) {
        value += expenselist[i].value;
      }

      data.add(value.abs());
    }

    setRankingTransaction(firstDay.value);

    pricePoint.value = data.mapIndexed(
      (index, element) => PricePoint(x: index.toDouble(), y: element)
    ).toList();

  }

  void setIncomeTransactionByDay(DateTime dt) {
    data.value = [];

    dateInMonth.value = daysInMonth(dt.year, dt.month);

    for (int i = 0; i < dateInMonth.value; i++) {
      var expenselist = homeController.allTransaction.where(
        (tran) => 
        DateTime.parse(tran.date).day == dt.day + i && 
        DateTime.parse(tran.date).month == dt.month && 
        DateTime.parse(tran.date).year == dt.year && 
        tran.value > 0
      ).toList();

      var value = 0.0;
      for (int i = 0; i < expenselist.length; i++) {
        value += expenselist[i].value;
      }

      data.add(value.abs());
    }

    setRankingTransaction(firstDay.value);

    pricePoint.value = data.mapIndexed(
      (index, element) => PricePoint(x: index.toDouble(), y: element)
    ).toList();

  }

  void setRankingTransaction(DateTime dt) {
    if (reporttype.value == 'income') {
      rankingTransaction.value = homeController.allTransaction.where(
        (e) => e.value > 0 && 
        DateTime.parse(e.date).month == dt.month &&
        DateTime.parse(e.date).year == dt.year
      ).sorted((a, b) => b.value.abs().compareTo(a.value.abs())).toList();

      if (rankingTransaction.length > 3) {
        rankingTransaction.value = rankingTransaction.sublist(0, 3);
      }

    } else {
      rankingTransaction.value = homeController.allTransaction.where(
        (e) => e.value < 0 && 
        DateTime.parse(e.date).month == dt.month &&
        DateTime.parse(e.date).year == dt.year
      ).sorted((a, b) => b.value.abs().compareTo(a.value.abs())).toList();

      if (rankingTransaction.length > 3) {
        rankingTransaction.value = rankingTransaction.sublist(0, 3);
      }
    }
  }


  void setNextMonth() {
    firstDay.value = DateTime(
      firstDay.value.year,
      firstDay.value.month + 1,
      1
    );
  }

  void setPreviousMonth() {
    firstDay.value = DateTime(
      firstDay.value.year,
      firstDay.value.month - 1,
      1
    );

    if (reporttype.value == 'income') {
      setIncomeTransactionByDay(firstDay.value);
    } else {
      setExpenseTransactionByDay(firstDay.value);
    }
  }
}