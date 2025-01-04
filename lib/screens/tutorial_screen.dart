import 'package:flutter/material.dart';
import 'package:idpet/screens/third_tutorial_screen.dart';
import 'package:idpet/screens/first_tutorial_screen.dart';
import 'package:idpet/screens/second_tutorial_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
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
          FirstTutorialScreen(),
          SecondTutorialScreen(),
          ThirdTutorialScreen()
        ],
      ),
    );
  }
}
