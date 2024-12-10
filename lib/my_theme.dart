import 'package:flutter/material.dart';
import 'package:islamic_app/app_colors.dart';

class MyThemeData{
static final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.white,
    showUnselectedLabels: true,
    unselectedItemColor: AppColors.blackColor,
    backgroundColor: AppColors.primaryDark,
  )
);
//عشان اقدر اوصله علي طول static
// final عشان اديله قيمه مره بعدين

}