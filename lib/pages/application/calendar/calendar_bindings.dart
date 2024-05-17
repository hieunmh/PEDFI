import 'package:get/get.dart';
import 'package:pedfi/pages/application/calendar/calendar_controller.dart';

class CalendarBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
  
}