import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idpet/models/ArrowBackWidget.dart';
import 'package:idpet/models/DialogWidget.dart';
import 'package:idpet/views/FirstTutorial.dart';
import '../controllers/RegisterControllers.dart';
import '../controllers/TermsAndConditions.dart';
import '../models/BackgroudWidget.dart';
import '../models/UserApp.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  RxBool _activeLoginButton = true.obs;
  final TermsAndConditions termsController = Get.put(TermsAndConditions());
  final RegisterControllers registerControllers =
  Get.put(RegisterControllers());

  Future<dynamic> _validarCampos() async {
    String usuario = registerControllers.usuarioController.text;
    String email = registerControllers.emailController.text;
    String senha = registerControllers.senhaController.text;
    String confirmaSenha = registerControllers.confirmasenhaController.text;

    RegExp regexEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (usuario.isNotEmpty) {
      if (email.isNotEmpty && regexEmail.hasMatch(email)) {
        if (senha.isNotEmpty && senha.length >= 6) {
          if (senha == confirmaSenha) {
            if (termsController.isChecked.value) {
              UserApp userApp = UserApp();
              userApp.nomeUsuario = usuario;
              userApp.email = email;
              userApp.senha = senha;

              _cadastrarUsuario(userApp);

              registerControllers.usuarioController.clear();
              registerControllers.emailController.clear();
              registerControllers.senhaController.clear();
              registerControllers.confirmasenhaController.clear();
              termsController.isChecked.value = false;

            } else {
              DialogWidget('ATENÇÃO!',
                  'aceite os termos de Política e Privacidade para liberar o cadastro.')
                  .showDialog();
            }
          } else {
            DialogWidget('não bate!',
                'campo Confirmar senha está diferente do campo da Senha.')
                .showDialog();
          }
        } else if (senha.isNotEmpty && senha.length < 6) {
          DialogWidget('Muito Pouco!', 'Senha deve ter no min, 6 caracteres.')
              .showDialog();
        } else {
          DialogWidget('Ops!', 'Preencha a senha!').showDialog();
        }
      } else {
        DialogWidget('Eita!', 'Preencha o campo com E-mail válido')
            .showDialog();
      }
    } else {
      DialogWidget('Ops!', 'Preencha todos os campos.').showDialog();
    }
  }

  _cadastrarUsuario (UserApp userApp) {
    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> confirmando() async {
      await auth.createUserWithEmailAndPassword(
          email: userApp.email!,
          password: userApp.senha!
      ).then((firebaseUser) {
        //salvar dados do usuário
        FirebaseFirestore db = FirebaseFirestore.instance;

        db.collection("usuarios")
            .doc(firebaseUser.user?.uid)
            .set(userApp.toMap());

         Get.offAllNamed('/Tutorial');

      }).catchError((error) {
        print("erro app: $error");

        Get.back();
        DialogWidget('Vish!', 'Erro ao cadastrar usuário, verifique os campos e tente novamente!').showDialog();

      });
    }

    Get.to(() =>
      FutureBuilder(
        future: confirmando(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
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
        }
      ),
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
                  height: 270,
                  color: const Color(0xFF5CF79F),
                  child: Stack(alignment: Alignment.topCenter, children: [
                    BackgroundWidget(constraints: constraints),
                    const ArrowBackWidget(),
                    Positioned(
                      top: 20,
                      child: Image.asset(
                        'assets/register.png',
                        width: 310,
                        height: 250,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 0,
                      constraints.maxWidth * .09, 12),
                  child: TextField(
                    controller: registerControllers.usuarioController,
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
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      hintText: "Usuário",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 0,
                      constraints.maxWidth * .09, 12),
                  child: TextField(
                    controller: registerControllers.emailController,
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
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 0,
                      constraints.maxWidth * .09, 12),
                  child: TextField(
                    controller: registerControllers.senhaController,
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    maxLength: 20,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  padding: EdgeInsets.fromLTRB(constraints.maxWidth * .09, 0,
                      constraints.maxWidth * .09, 0),
                  child: TextField(
                    controller: registerControllers.confirmasenhaController,
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    maxLength: 20,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      hintText: "Confirmar senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: termsController.isChecked.value,
                          onChanged: (value) {
                            termsController.toggleCheckbox();
                            print('CHECKBOX ESTA ${termsController.isChecked.value}');
                          },
                        ),
                        Text('Aceito os termos de '),
                        GestureDetector(
                          child: const Text(
                            'Política e Privacidade.',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Get.toNamed('/Terms');
                          },
                        ),
                      ]),
                ),
                Center(
                    child: Obx(
                  () =>
                      GestureDetector(
                    onTap: _activeLoginButton.value
                        ? () {
                            _activeLoginButton.value = false;
                            _validarCampos().then((_) {
                              _activeLoginButton.value = true;
                            });
                          }
                        : null,
                    child:
                        Image.asset('assets/registerButton.png', height: 110),
                  ),
                )),
              ]),
            ),
          );
        }),
      ),
    );
  }
}
