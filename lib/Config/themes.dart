import 'package:flutter/material.dart';

/*
Theme class definition, Defines the whole themedata
for light mode and dark mode
called in main.dart
*/
class MyThemeData {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}
