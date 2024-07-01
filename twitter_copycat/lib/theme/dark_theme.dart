import 'package:flutter/material.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(20, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(20, 255, 255, 255),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}