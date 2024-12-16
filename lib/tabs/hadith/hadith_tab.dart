import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/app_colors.dart';
import '../../Models/hadith_model.dart';
import 'hadith_view.dart';

class HadithTab extends StatefulWidget {
  static const String routeName = 'hadith_view';

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) {
      loadHadithFile();
    }
    return Column(
      children: [
        Image.asset('assets/images/Logo.png'),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 600,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: hadithList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              GestureDetector(
                onTap:(){
                  Navigator.of(context).pushNamed(HadithView.routeName,
                    arguments: hadithList[itemIndex]);
                },
                child: Container(
                    decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(20),
                      color: AppColors.primaryDark,
                      image: const DecorationImage(
                          image: AssetImage('assets/images/hadithpgview.png'),
                      fit: BoxFit.fill),
                    ),
                    child: hadithList.isEmpty
                        ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                  hadithList[itemIndex].tittle,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              const SizedBox(height: 30),
                              Expanded(
                                child: Text(
                                    hadithList[itemIndex].content.join(),
                                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ),
                              ),
                            ],
                          ),
                        )),
              ),
        ),
      ],
    );
  }

  void loadHadithFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadithLines = hadithContent.split('\n');

      String tittle = hadithLines[0];
      hadithLines.removeAt(0);
      HadithModel hadithModel =
          HadithModel(content: hadithLines, tittle: tittle);
      hadithList.add(hadithModel);
      setState(() {});
    }
  }
}
