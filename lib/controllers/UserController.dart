import 'package:get/get.dart';
import 'package:idpet/models/UserApp.dart';

class UserController extends GetxController{
  final userApp = UserApp().obs;

  updateUserApp(
      {String? idUsuario,
      String? nome,
      String? email,
      String? senha,
      String? nomeUsuario}) {
    userApp.update((val) {
      val?.idUsuario = idUsuario;
      val?.nome = nome;
      val?.email = email;
      val?.senha = senha;
      val?.nomeUsuario = nomeUsuario;
    });
  }

  createUserFirebase() {
    // Acessa os atributos do objeto observável user
    String? nome = userApp.value.nome;
    String? email = userApp.value.email;
    String? nomeUsuario = userApp.value.nomeUsuario;

    Map<String, dynamic> usuarioMap = userApp.value.toMap();

    return usuarioMap;
  }
}