import 'package:get/get.dart';

import 'index.dart';

class MedicineCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicineCalendarController());
  }
}
