import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:idpet/controllers/LoginControllers.dart';
import 'package:idpet/models/BackgroudWidget.dart';
import 'package:idpet/models/UserApp.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());
  RxBool _activeLoginButton = true.obs;

  _showDialog(String title, String message) {
    Get.defaultDialog(
      title: title,
      content: Text(message),
      textConfirm: 'Entendi',
      confirmTextColor: Colors.black,
      buttonColor: const Color(0xFF5CF79F),
      radius: 20,
      onConfirm: () {
        Get.back();
      },
    );
  }

  Future<dynamic> _validarCampos() async {
    String email = controller.emailController.text;
    String senha = controller.senhaController.text;

    RegExp regexEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isNotEmpty && regexEmail.hasMatch(email)) {
      if (senha.isNotEmpty && senha.length >= 4) {
        UserApp userapp = UserApp();
        userapp.email = email;
        userapp.senha = senha;

        print('EMAIL E SENHA APROVADOS, USUARIO VAI PRA HOME!');

        //_logarUsuario( userapp );

        controller.emailController.clear();
        controller.senhaController.clear();
      } else if (senha.isNotEmpty && senha.length < 4) {
        _showDialog('Muito pouco!', 'Senha deve ter no min. 4 caracteres!');
      } else {
        _showDialog('Ops!', 'Preencha a senha!');
      }
    } else {
      _showDialog('Eita!', 'Preencha o campo com E-mail válido');
    }
  }

  _logarUsuario(UserApp userapp) {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
      email: userapp.email!,
      password: userapp.senha!,
    )
        .then((firebaseUser) {
      //Navigator.pushNamedAndRemoveUntil(context, RouteGenerator.ROTA_HOME, (_) => false);
    }).catchError((error) {
      _showDialog('Vish!',
          'Erro ao autenticar o usuário, verifique o email e senha e tente novamente!');
    });
  }

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
              child: Column(children: [
                Container(
                  width: constraints.maxWidth,
                  height: 325,
                  color: const Color(0xFF5CF79F),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    BackgroundWidget(constraints: constraints),
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
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 20,
                      constraints.maxWidth * .09, 0),
                  child: TextField(
                    controller: controller.emailController,
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    maxLength: 60,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 20,
                      constraints.maxWidth * .09, 0),
                  child: TextField(
                    controller: controller.senhaController,
                    maxLength: 20,
                    obscureText: true,
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 5, constraints.maxWidth * .09, 0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        child: const Text(
                          "esqueci minha senha",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        onTap: () {
                          Get.toNamed('/ForgetPassword');
                        },
                      )),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Obx(() => GestureDetector(
                          onTap: _activeLoginButton.value
                              ? () {
                                  _activeLoginButton.value = false;

                                  _validarCampos().then((_) {
                                    _activeLoginButton.value = true;
                                  });
                                }
                              : null,
                          child: Image.asset(
                            'assets/loginButton.png',
                            width: 150,
                            height: 120,
                          ),
                        )),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não tem conta? '),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/Register');
                        },
                        child: const Text(
                          'Cadastre-se!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                ),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
