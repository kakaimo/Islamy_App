import 'package:flutter/material.dart';
import 'package:islamic_app/home_screen.dart';
import 'package:islamic_app/my_theme.dart';
import 'package:islamic_app/tabs/hadith/hadith_view.dart';
import 'package:islamic_app/tabs/quran/sura_view.dart';

import 'on_boarding/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraView.routeName : (context) => SuraView(),
        HadithView.routeName : (context) => HadithView(),
        OnboardingScreen.routeName : (context) => OnboardingScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
