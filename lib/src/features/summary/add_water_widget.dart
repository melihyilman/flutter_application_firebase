import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/common/colors.dart';
import 'package:flutter_application_firebase/src/utils/extensions/color_extensions.dart';
import 'package:get/get.dart';

import 'index.dart';

class AddWaterWidget extends StatelessWidget {
  final SummaryController controller = Get.put(SummaryController());
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      controller.dateTime.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.waterCount.value = 300;
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        color: AppColors.borderColor.darken(20),
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Zaman',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Obx(() {
                    final selectedTime = controller.dateTime.value;
                    return Text(selectedTime != null
                        ? 'Saat: ${selectedTime.format(context)}'
                        : 'Saat');
                  }),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) =>
                      controller.waterCount.value = int.tryParse(value) ?? 0,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Miktar',
                    hintText: 'Enter a number',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.addNewWater();
                    Get.back();
                  },
                  child: Text('Ekle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
