import 'package:flutter/material.dart';
import 'package:idpet/views/FirstTutorial.dart';
import 'package:idpet/views/SecondTutorial.dart';
import 'package:idpet/views/ThirdTutorial.dart';
import 'package:get/get.dart';

import '../controllers/UserController.dart';

class Tutorial extends StatefulWidget {
   const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          FirstTutorial(),
          SecondTutorial(),
          ThirdTutorial()
        ],
      ),
    );
  }
}
