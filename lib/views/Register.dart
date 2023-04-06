import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idpet/models/ArrowBackWidget.dart';
import '../controllers/TermsAndConditions.dart';
import '../models/BackgroudWidget.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TermsAndConditions termsController = Get.put(TermsAndConditions());
  RxBool _isChecked = false.obs;

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
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    maxLength: 20,
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
                    buildCounter: (BuildContext context,
                            {int? currentLength,
                            int? maxLength,
                            bool? isFocused}) =>
                        null,
                    maxLength: 20,
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
                  child: GestureDetector(
                    child: Image.asset('assets/registerButton.png',
                    height: 110),
                    onTap: (){},
                  ),
                )
              ]),
            ),
          );
        }),
      ),
    );
  }
}
