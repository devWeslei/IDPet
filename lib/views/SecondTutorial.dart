import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SecondTutorial extends StatelessWidget {
  const SecondTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.maxWidth <= 600 ? constraints.maxWidth : 600,
            height: constraints.maxHeight,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/secondTutorial.png',
                  width: 264,
                  height: 233,
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text('Perfil',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                const Text(
                    'Tenha todas as informações necessárias\n do seu pet em mãos com uma\n divertida identidade digital.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5CF79F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                      child: Container(
                        width: 30,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5CF79F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5CF79F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
