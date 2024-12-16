import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../app_colors.dart';
import '../home_screen.dart';

class OnboardingScreen extends StatefulWidget {

  static const String routeName = 'onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  // Pages for the onboarding screen
  final List<PageViewModel> pages = [
    buildPage(
      imagePath: "assets/images/hii.png",
      title: "Welcome To Islami App",
      description: "",
    ),
    buildPage(
      imagePath: "assets/images/masged.png",
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community .",
    ),
    buildPage(
      imagePath: "assets/images/moshaf.png",
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous .",
    ),
    buildPage(
      imagePath: "assets/images/sebha.png",
      title: "Bearish",
      description:
      "Praise the name of your Lord, the Most High .",
    ),
    buildPage(
      imagePath: "assets/images/radio.png",
      title: "Holy Quran Radio",
      description:
      "You can listen to the Holy Quran Radio through the application for free and easily .",
    ),
  ];

  static PageViewModel buildPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox.shrink(), // Remove any top title
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo at the very top of the screen
          Image.asset(
            "assets/images/Logo.png",
          ),
          const SizedBox(height: 20),
          // Dynamic Image (specific for each page)
          Image.asset(
            imagePath,
            height: 400,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          // Title (specific for each page)
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          // Description (specific for each page)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: IntroductionScreen(
        globalBackgroundColor: AppColors.blackColor,
        pages: pages,
        showSkipButton: false,
        dotsDecorator: DotsDecorator(
          activeColor: AppColors.primaryDark,
          color: Colors.grey,
          activeSize: const Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        showBackButton: currentPage > 0,
        back:  const Text(
          "Back",
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        next: const Text(
          "Next",
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        done: const Text(
          "Finish",
          style: TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        onChange: (index) {
          setState(() {
            currentPage = index;
          });
        },
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  HomeScreen()),
          );
        },
      ),
    );
  }
}