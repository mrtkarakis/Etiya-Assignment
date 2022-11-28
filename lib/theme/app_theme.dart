import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData.dark().copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.white),
    ),
  );
}
