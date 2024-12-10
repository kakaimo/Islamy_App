import 'package:flutter/material.dart';
import 'package:islamic_app/app_colors.dart';

Widget builtItemInBottomNavBar ({required int index , required String picName ,required int selected }){
  return
    selected == index ?
    Container(
      padding:
      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColors.blackBgColor,
      ),
      child: ImageIcon(
          AssetImage('assets/images/${picName}_logo.png')),
    )
        : ImageIcon(AssetImage('assets/images/${picName}_logo.png'));
}