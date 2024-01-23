import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: Colors.black,
      secondary: const Color.fromARGB(255, 6, 66, 116),
      tertiary: Colors.black),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      background: Colors.black,
      primary: Colors.white,
      secondary: Color.fromARGB(255, 40, 125, 194),
      tertiary: Colors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
);
