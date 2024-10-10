import 'package:flutter/material.dart';
import '../../../responsive/dimension.dart';
import 'app_color.dart';

class Apptheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    fontFamily: 'BreeSerif',
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primary,
        hintStyle: const TextStyle(
            color: Color(0xffA7A7A7), fontWeight: FontWeight.w500),
        contentPadding: EdgeInsets.all(DSH(20)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSH(4)),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(DSH(4)),
            borderSide: BorderSide.none)),
  );
}
