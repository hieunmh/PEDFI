import 'package:get/get.dart';
import 'package:pedfi/pages/application/report/report_controller.dart';

class ReportBidings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}