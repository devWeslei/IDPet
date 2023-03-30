import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Home.dart';


class Teste extends StatelessWidget {
   Teste({Key? key}) : super(key: key);

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Teste tela 2'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {  },
            child: Text("O numero de vzs ${c.count}")),
      ),

    );
  }
}
