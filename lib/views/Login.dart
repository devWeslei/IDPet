import 'package:flutter/material.dart';
import '../models/Backgroud.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(alignment: Alignment.topCenter, children: [
                      Background(),
                      Image.asset(
                        'assets/logoLogin.png',
                        width: 174,
                        height: 187,
                      ),
                      Positioned(
                        top: 160,
                        child: Image.asset(
                          'assets/title.png',
                          width: 400,
                          height: 200,
                        ),
                      ),
                    ]),
        );
  }
}
