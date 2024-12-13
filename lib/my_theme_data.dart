import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';

class MyThemeData{
  static final ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryDark),
      backgroundColor: AppColors.blackColor,
    )
  );

}