import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData.dark().copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      contentPadding: EdgeInsets.only(
        left: 9,
        right: 9,
        bottom: 4,
      ),
    ),
  );
}
