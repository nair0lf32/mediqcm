import 'package:flutter/material.dart';

/*
Theme class definition, Defines the whole themedata
for light mode and dark mode
called in main.dart
*/
class MyThemeData {
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.grey,
    ),
  );

  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.grey,
    ),
  );
}
