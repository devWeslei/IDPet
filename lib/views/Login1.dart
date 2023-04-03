import 'package:flutter/material.dart';
import '../models/Backgroud.dart';

class Login1 extends StatelessWidget {
  Login1({Key? key}) : super(key: key);

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
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: 325,
                        color: const Color(0xFF5CF79F),
                        child: Stack(alignment: Alignment.topCenter,children: [
                          Positioned(
                            top: -110,
                            left: constraints.maxWidth <= 600 ? (constraints.maxWidth / 2) - (460 / 2) : (600 / 2) - (455 / 2),
                            child: Transform.scale(
                              scale: 1.3,
                              child: ClipOval(
                                child: Container(
                                  color: const Color(0xFFF2ACE1),
                                  width: 455,
                                  height: 314,
                                ),
                              ),
                            ),
                          ),
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
                        ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: TextField(
                          textAlign: TextAlign.center,
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "E-mail",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Senha",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ]),
                ),
              );
          }),
      ),
    );
  }
}