import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idpet/routes/Routes.dart';
import 'package:idpet/theme/Themes.dart';
import 'package:idpet/views/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Platform.isAndroid ? DefaultTheme() : IOSTheme(),
    getPages: Routes.routes,
    home: SplashScreen(nextScreen:'/Login1', duration: 6000),
  ));

}


