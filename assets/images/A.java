import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SebhaScreen(),
    );
  }
}

class SebhaTab extends StatefulWidget {
  @override
  _SebhaScreenState createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> with SingleTickerProviderStateMixin {
  int count = 0;
  String text = "سبحان الله";
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  void onSebhaClicked() {
    setState(() {
      count++;
      if (count > 30) {
        count = 1;
        if (text == "سبحان الله") {
          text = "الحمدلله";
        } else if (text == "الحمدلله") {
          text = "لا إله إلا الله";
        } else {
          text = "سبحان الله";
        }
      }
    });

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Islami Sebha'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sebha_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onSebhaClicked,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value,
                        child: Image.asset('assets/images/sebha_rotat.png', width: 150, height: 150),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  text,
                  style: TextStyle(fontSize: 28, color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  count.toString(),
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
