import 'package:flutter/material.dart';
import '../models/Backgroud.dart';

class Login extends StatelessWidget {
   Login ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Background(),
        Center(
          child: Column(children: [
            Image.asset(
              'assets/logoLogin.png',
              width: 174,
              height: 187,
            ),
            Image.asset(
              'assets/title.png',
              width: 400,
              height: 200,
            ),
          ]),
        ),
      ],
    ));
  }
}

