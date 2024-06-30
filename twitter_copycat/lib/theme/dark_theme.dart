import 'package:flutter/material.dart';
import 'package:twitter_copycat/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color.fromARGB(22,22,22,1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(22,22,22,1),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}