import 'package:get/get.dart';
import 'package:pedfi/model/transaction_model.dart';
import 'package:pedfi/pages/application/home/home_controller.dart';
import 'package:pedfi/pages/application/report/price_point.dart';
import 'package:collection/collection.dart';

class ReportController extends GetxController {


  var pricePoint =<PricePoint>[].obs;

  var reporttype = 'income'.obs;

  var expenseCategory = <Transaction>[].obs;

  var homeController = Get.find<HomeController>();

  var startOfWeek = DateTime(
    DateTime.now().year, 
    DateTime.now().month, 
    DateTime.now().day - DateTime.now().weekday % 7 + 1
  ).obs;

  var endOfWeek = DateTime(
    DateTime.now().year, 
    DateTime.now().month, 
    DateTime.now().day - DateTime.now().weekday % 7  + 7
  ).obs;

  var data = <double>[].obs;
  

  @override
  void onInit() {
    super.onInit();

    setIncomeCategoryByDay(startOfWeek.value);
  }  

  void setExpenseCategoryByDay(DateTime dt) {

    data.value = [];

    for (int i = 0; i < 7; i++) {
      var expenselist = homeController.allTransaction.where(
        (tran) => DateTime.parse(tran.date).day == dt.day + i
        && DateTime.parse(tran.date).month == dt.month 
        && DateTime.parse(tran.date).year == dt.year 
        && tran.value < 0
      ).toList();

      var value = 0.0;
      for (int i = 0; i < expenselist.length; i++) {
        value += expenselist[i].value / 1000;
      }

      data.add(value.abs());
    }

    pricePoint.value = data.mapIndexed(
      (index, element) => PricePoint(x: index.toDouble(), y: element)
    ).toList();

  }

  void setIncomeCategoryByDay(DateTime dt) {
    data.value = [];

    for (int i = 0; i < 7; i++) {
      var expenselist = homeController.allTransaction.where(
        (tran) => DateTime.parse(tran.date).day == dt.day + i
        && DateTime.parse(tran.date).month == dt.month 
        && DateTime.parse(tran.date).year == dt.year 
        && tran.value > 0
      ).toList();

      var value = 0.0;
      for (int i = 0; i < expenselist.length; i++) {
        value += expenselist[i].value / 1000;
      }

      data.add(value.abs());
    }

    pricePoint.value = data.mapIndexed(
      (index, element) => PricePoint(x: index.toDouble(), y: element)
    ).toList();
  }


  void setNextWeek() {
    startOfWeek.value = DateTime(
      startOfWeek.value.year,
      startOfWeek.value.month,
      startOfWeek.value.day + 7
    );

    endOfWeek.value = DateTime(
      endOfWeek.value.year,
      endOfWeek.value.month,
      endOfWeek.value.day + 7
    );
  }

  void setPreviousWeek() {
    startOfWeek.value = DateTime(
      startOfWeek.value.year,
      startOfWeek.value.month,
      startOfWeek.value.day - 7
    );

    endOfWeek.value = DateTime(
      endOfWeek.value.year,
      endOfWeek.value.month,
      endOfWeek.value.day - 7
    );

    if (reporttype.value == 'income') {
      setIncomeCategoryByDay(startOfWeek.value);
    } else {
      setExpenseCategoryByDay(startOfWeek.value);
    }
  }
}