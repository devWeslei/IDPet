import 'package:get/get.dart';
import 'package:idpet/views/FirstTutorial.dart';
import 'package:idpet/views/ThirdTutorial.dart';
import '../views/Home.dart';
import '../views/Login.dart';
import '../views/Login1.dart';
import '../views/SecondTutorial.dart';

class Routes {
   static final routes = [
      GetPage(name: '/Login', page: ()=> Login()),
      GetPage(name: '/Login1', page: ()=> Login1()),
      GetPage(name: '/Home', page: ()=> Home()),
      GetPage(name: '/firstTutorial', page: ()=> FirstTutorial()),
      GetPage(name: '/secondTutorial', page: ()=> SecondTutorial()),
      GetPage(name: '/thirdTutorial', page: ()=> ThirdTutorial()),
   ];

}

