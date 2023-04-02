import 'package:flutter/material.dart';

 Background () {
   return Scaffold(
     backgroundColor: const Color(0xFF5CF79F),
     body: Center(
       child: LayoutBuilder(
           builder: (BuildContext context, BoxConstraints constraints) {
             return Container(
               width: constraints.maxWidth <= 600 ? constraints.maxWidth : 600,
               color: const Color(0xFF5CF79F),
               constraints: const BoxConstraints(maxWidth: 600),
               child: Stack(children:[
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
               ]),
             );
           }),
     ),
   );
 }