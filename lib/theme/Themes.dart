import 'package:flutter/material.dart';

DefaultTheme () {
  return  ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF5CF79F),
        secondary: const Color(0xFFF2ACE1),
      ));
}

IOSTheme (){
  return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF5CF79F),
        secondary: const Color(0xFFF2ACE1),
      ));
}
