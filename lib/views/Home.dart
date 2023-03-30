import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Teste.dart';


class Controller extends GetxController{
  var count = 0.obs;
  increment() => count.value++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text("Total de cliques: ${c.count}"))),
        body: Center(
            child: ElevatedButton(
                child: Text("Ir pra Outra tela"),
                onPressed: () => Get.to(() => Teste()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}
