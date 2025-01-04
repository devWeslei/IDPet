import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idpet/controllers/login_controller.dart';
import 'package:idpet/models/backgroudwidget_model.dart';
import 'package:idpet/models/userapp_model.dart';

import '../models/dialogwidget_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());
  RxBool _activeLoginButton = true.obs;

  Future<dynamic> _validarCampos() async {
    String email = controller.emailController.text;
    String senha = controller.senhaController.text;

    RegExp regexEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email.isNotEmpty && regexEmail.hasMatch(email)) {
      if (senha.isNotEmpty && senha.length >= 6) {
        UserAppModel userapp = UserAppModel();
        userapp.email = email;
        userapp.senha = senha;

        print('EMAIL E SENHA APROVADOS, USUARIO VAI PRA HOME!');

        _logarUsuario(userapp);

        controller.emailController.clear();
        controller.senhaController.clear();
      } else if (senha.isNotEmpty && senha.length < 6) {
        DialogWidgetModel(
                'Muito Pouco!', 'Senha deve ter no min, 6 caracteres.')
            .showDialog();
      } else {
        DialogWidgetModel('Ops!', 'Preencha a senha!').showDialog();
      }
    } else {
      DialogWidgetModel('Eita!', 'Preencha o campo com E-mail válido')
          .showDialog();
    }
  }

  _logarUsuario(UserAppModel userapp) {
    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> confirmando() async {
      await auth
          .signInWithEmailAndPassword(
        email: userapp.email!,
        password: userapp.senha!,
      )
          .then((firebaseUser) {
        Get.offAllNamed('/Home');
      }).catchError((error) {
        print("erro app: $error");

        Get.back();
        DialogWidgetModel('Vish!',
                'Erro ao logar o usuário, verifique o email e senha e tente novamente!')
            .showDialog();
      });
    }

    Get.to(
      () => FutureBuilder(
          future: confirmando(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/gif.gif',
                    width: 176.0,
                    height: 176.0,
                  ),
                ),
              );
            }
            return Container();
          }),
    );
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
                    BackgroundWidgetModel(constraints: constraints),
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
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
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
