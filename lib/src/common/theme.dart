import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  // accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: ButtonThemeData(
    buttonColor: const Color.fromARGB(255, 109, 82, 0),
    disabledColor: Colors.grey,
  ),
);

ThemeData _lightTheme = ThemeData(
  // accentColor: Colors.pink,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    disabledColor: Colors.grey,
  ),
);
