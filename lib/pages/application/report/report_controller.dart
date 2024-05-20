import 'package:get/get.dart';
import 'package:pedfi/pages/application/report/price_point.dart';
import 'package:collection/collection.dart';

class ReportController extends GetxController {


  var pricePoint =<PricePoint>[].obs;

  var reporttype = 'income'.obs;

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
  

  @override
  void onInit() {
    super.onInit();

    print(startOfWeek);
    print(endOfWeek);

    final data = <double>[6, 4, 6, 7, 3, 20, 15];

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
  }
}