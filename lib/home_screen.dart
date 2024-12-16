import 'package:flutter/material.dart';
import 'package:islamic_app/tabs/hadith/hadith_tab.dart';
import 'package:islamic_app/tabs/quran/quran_tab.dart';
import 'package:islamic_app/tabs/radio/radio_tab.dart';
import 'package:islamic_app/tabs/sebha/sebha_tab.dart';
import 'package:islamic_app/tabs/time/time_tab.dart';
import 'package:islamic_app/widget/builtItemInBottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImg = [
    'assets/images/quran_bg.png',
    'assets/images/hadith_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png',
  ];
  List<Widget> tabs = [
    QuranTap(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backGroundImg[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 0, picName: 'quran',selected: selectedIndex),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 1, picName: 'hadith',selected: selectedIndex),
                  label: 'Hadith',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 2, picName: 'sebha',selected: selectedIndex),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 3, picName: 'radio',selected: selectedIndex),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 4, picName: 'time',selected: selectedIndex),
                  label: 'Time',
                ),
              ]),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

}
