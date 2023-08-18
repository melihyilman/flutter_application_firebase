import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryController extends GetxController {
  final title = 'Summary'.obs;
  var dateTime = Rx<TimeOfDay?>(null);
  var waterCount = 300.obs;
  SharedPreferences? prefs;
  @override
  void onInit() {
    super.onInit();
    _loadSavedValues();
  }

  Future<void> _loadSavedValues() async {
    prefs = await SharedPreferences.getInstance();
    final savedValues = prefs!.getStringList('values');

    if (savedValues != null && savedValues.length >= 2) {
      final savedTimeParts = savedValues[0].split(':');
      dateTime.value = TimeOfDay(
        hour: int.parse(savedTimeParts[0]),
        minute: int.parse(savedTimeParts[1]),
      );

      waterCount.value = savedValues[1] as int;
    }
  }

  void addNewWater() {
    final values = [
      '${dateTime.value!.hour}:${dateTime.value!.minute}',
      waterCount.value,
    ];
    prefs!.setStringList(
        'values', values.map((value) => value.toString()).toList());
    var aa = prefs!.getStringList('values');
    print(aa);
  }
}
