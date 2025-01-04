import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  final int duration;
  final String nextScreen;

  SplashScreen({
    this.duration = 3000,
     required this.nextScreen,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds:widget.duration), () {
      Get.offAllNamed(widget.nextScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          ),
      child: Center(
        child: Image.asset(
          'assets/gif.gif',
          width: 176.0,
          height: 176.0,
        ),
      ),
    );
  }
}