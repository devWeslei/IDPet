import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/BackgroudWidget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5CF79F),
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            width: constraints.maxWidth <= 600 ? constraints.maxWidth : 600,
            height: constraints.maxHeight,
            color: const Color(0xFF5CF79F),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  width:
                      constraints.maxWidth <= 600 ? constraints.maxWidth : 600,
                  height: 260,
                  color: const Color(0xFF5CF79F),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    // BackgroundWidget(constraints: constraints),
                      Image.asset('assets/photoHome.jpg',
                          fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity),
                    Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent, // Cor transparente no topo do degradê
                              Color(0xFF5CF79F), // Cor com transparência na parte inferior do degradê
                            ],
                            begin: Alignment(0.0, 0.2), // Início do degradê 80% abaixo do centro vertical
                            end: Alignment.bottomCenter, // Final do degradê na parte inferior
                          ),
                        ),
                      ),
                  ]),
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
