import 'package:flutter/material.dart';

import '../app_colors.dart';

class SuraContentCard extends StatelessWidget {
  String content;
  int index ;
  SuraContentCard({required this.content ,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryDark,width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text('$content[${index+1}]',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const  TextStyle(
              color: AppColors.primaryDark,
              fontSize: 22
          ),

        ),
      ),
    );
  }
}
