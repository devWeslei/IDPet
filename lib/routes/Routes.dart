import 'package:get/get.dart';
import 'package:idpet/views/FirstTutorial.dart';
import 'package:idpet/views/ForgetPassword.dart';
import 'package:idpet/views/Register.dart';
import 'package:idpet/views/Terms.dart';
import 'package:idpet/views/ThirdTutorial.dart';
import '../views/Home.dart';
import '../views/Login.dart';
import '../views/SecondTutorial.dart';
import '../views/Tutorial.dart';

class Routes {
   static final routes = [
      GetPage(name: '/Login', page: ()=> Login()),
      GetPage(name: '/Home', page: ()=> Home()),
      GetPage(name: '/Register', page: ()=> Register()),
      GetPage(name: '/Terms', page: ()=> Terms()),
      GetPage(name: '/ForgetPassword', page: ()=> ForgetPassword()),
      GetPage(name: '/Tutorial', page: ()=> Tutorial()),
      GetPage(name: '/FirstTutorial', page: ()=> FirstTutorial()),
      GetPage(name: '/SecondTutorial', page: ()=> SecondTutorial()),
      GetPage(name: '/ThirdTutorial', page: ()=> ThirdTutorial()),
   ];

}

