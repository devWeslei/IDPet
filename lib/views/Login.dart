import 'package:flutter/material.dart';


class Login extends StatelessWidget {
   Login ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste tela 2'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {  },
            child: Text("O numero de vzs")),
      ),

    );
  }
}
