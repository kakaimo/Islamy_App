import 'package:flutter/material.dart';
import 'package:islamic_app/Models/hadith_model.dart';

import '../../app_colors.dart';

class HadithView extends StatelessWidget {
  static const String routeName = 'hadith_view';


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadithModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              'assets/images/frame_pg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Column(
              children: [
                Text(
                  args.tittle,
                  style: const TextStyle(
                      color: AppColors.primaryDark, fontSize: 30),
                ),
                Expanded(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 25),
                          child: Text(args.content[index],style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 18
                          ),)
                        );
                      },
                      itemCount: args.content.length,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
