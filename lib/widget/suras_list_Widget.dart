import 'package:flutter/material.dart';
import 'package:islamic_app/Models/sura_model.dart';

import '../app_colors.dart';

class SurasListWedgit extends StatelessWidget {

  SuraModel suraModel;
   SurasListWedgit({required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween
      ,
      children: [
        Row(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/vector_img.png'),
              Center(
                child: Text('${suraModel.index+1}',
                  style: const TextStyle(
                      color: AppColors.white,fontSize: 14,fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(suraModel.suraEnName,
                style: const TextStyle(
                  color:AppColors.white,
                  fontSize: 16,
                ),),
              Text('${suraModel.numOfVerses} verses',
                style: const TextStyle(
                  color:AppColors.white,
                  fontSize: 14,
                ),),
            ],),
        ],)
        ,
        Text(suraModel.suraArName,
          style: const TextStyle(
            color:AppColors.white,
            fontSize: 16,
          ),),
      ],
    );
  }
}
