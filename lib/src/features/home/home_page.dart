import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/common/colors.dart';
import 'package:flutter_application_firebase/src/features/summary/add_water_widget.dart';
import 'package:flutter_application_firebase/src/utils/extensions/color_extensions.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Route :: " + Get.currentRoute);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/summary',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined),
              label: 'Anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_information),
              label: 'İlaçlar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_list),
              label: 'Raporlar',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint("test");
          print("asdas");
          Get.dialog(AddWaterWidget());

          // Add your onPressed code here!
        },
        label: const Text(
          'Ekle2',
        ),
        backgroundColor: AppColors.borderColor,
        icon: const Icon(Icons.add),
      ),

      // FloatingActionButton(
      //   backgroundColor: AppColors.contentColorCyan.lighten(20),
      //   onPressed: () {
      //     Get.changeTheme(ThemeData.dark());
      //   },
      //   child: const Icon(Icons.add_outlined),
      // ),
    );
  }
}
