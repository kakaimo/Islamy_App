import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0; // زاوية الدوران
  int count = 0;
  String text = "سبحان الله";

  void onSebhaClicked() {
    setState(() {
      count++;
      if (count > 30) {
        count = 1;
        if (text == "سبحان الله") {
          text = "الحمدلله";
        } else if (text == "الحمدلله") {
          text = "الله أكبر";
        } else {
          text = "سبحان الله";
        }
      }
      // Increment the rotation angle
      rotationAngle += 1/30;  // 1 = .

      // complete cycle 360
    });
  }
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Image.asset(
        'assets/images/sebha_bg.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: maxHeight * 0.25,
                child: Image.asset('assets/images/Logo.png')),
            SizedBox(
              height: maxHeight * 0.1,
              child: const Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: maxHeight * 0.55,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onSebhaClicked();
                        // زيادة الزاوية (بـ 1 دورة كاملة = 360°)
                      });
                    },
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 50), // مدة التحريك
                      turns: rotationAngle, // قيمة الدوران
                      child: Image.asset(
                        'assets/images/sebha_rotat.png', // مسار الصورة
                        width: 400,
                        height: 400,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                            fontSize: 36,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(count.toString(),
                          style: const TextStyle(
                              fontSize: 36,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}


