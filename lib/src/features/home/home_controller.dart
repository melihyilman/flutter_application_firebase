import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../medicine_calendar/index.dart';
import '../../common/routes.dart';
import '../summary/index.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/summary') {
      return GetPageRoute(
        settings: settings,
        page: () => const SummaryPage(),
        binding: SummaryBinding(),
      );
    }
    if (settings.name == '/medicine_calendar') {
      return GetPageRoute(
        settings: settings,
        page: () => const MedicineCalendarPage(),
        binding: MedicineCalendarBinding(),
      );
    }

    // if (settings.name == '/history')
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => HistoryPage(),
    //     binding: HistoryBinding(),
    //   );

    // if (settings.name == '/settings')
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => SettingsPage(),
    //     binding: SettingsBinding(),
    //   );

    return null;
  }

  void addWater() {}
}
