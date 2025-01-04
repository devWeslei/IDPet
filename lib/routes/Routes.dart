import 'package:get/get.dart';
import 'package:idpet/screens/register_screen.dart';
import 'package:idpet/screens/first_tutorial_screen.dart';
import 'package:idpet/screens/forget_password_screen.dart';
import 'package:idpet/screens/login_screen.dart';
import 'package:idpet/screens/second_tutorial_screen.dart';
import 'package:idpet/screens/terms_screen.dart';
import 'package:idpet/screens/third_tutorial_screen.dart';
import 'package:idpet/screens/tutorial_screen.dart';
import '../screens/Home_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/Login', page: () => LoginScreen()),
    GetPage(name: '/Home', page: () => HomeScreen()),
    GetPage(name: '/Register', page: () => RegisterScreen()),
    GetPage(name: '/Terms', page: () => TermsScreen()),
    GetPage(name: '/ForgetPassword', page: () => ForgetPasswordScreen()),
    GetPage(name: '/Tutorial', page: () => TutorialScreen()),
    GetPage(name: '/FirstTutorial', page: () => FirstTutorialScreen()),
    GetPage(name: '/SecondTutorial', page: () => SecondTutorialScreen()),
    GetPage(name: '/ThirdTutorial', page: () => ThirdTutorialScreen()),
  ];
}
