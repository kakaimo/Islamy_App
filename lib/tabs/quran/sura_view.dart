import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/Models/sura_model.dart';
import 'package:islamic_app/app_colors.dart';

import '../../widget/sura_content_card.dart';

class SuraView extends StatefulWidget {
  static const String routeName = 'sura_view';

  @override
  State<SuraView> createState() => _SuraViewState();
}

class _SuraViewState extends State<SuraView> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnName,
          style: const TextStyle(color: AppColors.primaryDark),
        ),
      ),
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
                  args.suraArName,
                  style: const TextStyle(
                      color: AppColors.primaryDark, fontSize: 30),
                ),
                Expanded(
                  child: verses.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ))
                      : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 25),
                                child: SuraContentCard(content : verses[index] , index: index,),
                              );
                            },
                            itemCount: verses.length,
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

  void loadSuraFile(int index) async {
    String suraContent =
    await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();
    verses = suraLines;
    setState(() {

    });
  }
}
