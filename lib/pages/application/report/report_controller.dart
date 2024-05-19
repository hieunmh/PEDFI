import 'package:get/get.dart';
import 'package:pedfi/pages/application/report/price_point.dart';
import 'package:collection/collection.dart';

class ReportController extends GetxController {


  var pricePoint =<PricePoint>[].obs;


  @override
  void onInit() {
    super.onInit();

    final data = <double>[6, 4, 6, 7, 3, 11, 20];

    pricePoint.value = data.mapIndexed(
      (index, element) => PricePoint(x: index.toDouble(), y: element)
    ).toList();
  }  

}