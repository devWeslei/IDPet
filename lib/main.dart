import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idpet/routes/routes.dart';
import 'package:idpet/theme/themes.dart';
import 'package:idpet/screens/splashscreen_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Platform.isAndroid ? DefaultTheme() : IOSTheme(),
    getPages: Routes.routes,
    home: SplashScreen(nextScreen: '/Login', duration: 6000),
  ));
}
