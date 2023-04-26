import 'package:get/get.dart';
import 'package:idpet/models/UserApp.dart';

class UserController extends GetxController{
  final userApp = UserApp().obs;

  updateUserApp(
      {String? idUser,
      String? name,
      String? email,
      String? password,
      String? nickName}) {
    userApp.update((val) {
      val?.idUser = idUser;
      val?.name = name;
      val?.email = email;
      val?.password = password;
      val?.nickName = nickName;
    });
  }

  createUserFirebase() {
    // Acessa os atributos do objeto observável user
    String? nome = userApp.value.name;
    String? email = userApp.value.email;
    String? nomeUsuario = userApp.value.nickName;

    Map<String, dynamic> usuarioMap = userApp.value.toMap();

    return usuarioMap;
  }
}