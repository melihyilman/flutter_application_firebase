import 'package:get/get.dart';

import 'index.dart';

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SummaryController());
  }
}
