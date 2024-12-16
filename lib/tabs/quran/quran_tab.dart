import 'package:flutter/material.dart';
import 'package:islamic_app/Models/sura_model.dart';
import 'package:islamic_app/app_colors.dart';
import 'package:islamic_app/tabs/quran/sura_view.dart';
import 'package:islamic_app/widget/suras_list_Widget.dart';

class QuranTap extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Logo.png'),
          TextField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              labelText: 'Sura Name',
              labelStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(
                  color: AppColors.primaryDark,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(
                  color: AppColors.primaryDark,
                  width: 1,
                ),
              ),
              prefixIcon: const ImageIcon(
                AssetImage(
                  'assets/images/prefix_icon.png',
                ),
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Most Recently',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Al-Anbiya',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Text(
                          'الانبياء',
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text('112 verses'),
                    ],
                  ),
                  Image.asset('assets/images/mostrecently_img.png'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Suras List',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.white,
                  thickness: 1,
                  indent: 50,
                  endIndent: 50,
                );
              },
              itemCount: SuraModel.getItemLength(),
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(SuraView.routeName,
                    arguments: SuraModel.getSuraModel(index));
                  },
                  child: SurasListWedgit(
                      suraModel: SuraModel.getSuraModel(index),)
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
