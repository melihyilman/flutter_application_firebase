import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/src/common/theme.dart';
import 'package:get/get.dart';

import 'src/features/home/index.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    defaultTransition: Transition.fade,
    getPages: [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: HomeBinding(),
      )
    ],
    themeMode: ThemeMode.dark,
    theme: darkTheme,
    darkTheme: darkTheme,
  ));
}
