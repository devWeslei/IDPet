import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeControllers extends GetxController {
  RxString nomeUsuario = ''.obs;

  _recuperarDadosUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;

     final FirebaseFirestore _db = FirebaseFirestore.instance;

     //função snapshots() do Firebase para escutar atualizações no documento
     _db.collection('usuarios').doc(usuarioLogado?.uid).snapshots().listen((
         doc) {
       // Atualizar a variável observável com o valor do campo 'nomeUsuario' no documento
       nomeUsuario.value = doc.get('nomeUsuario');
       update();
     });
   }

  @override
  onInit(){
    super.onInit();
     _recuperarDadosUsuarioLogado();
    }
  }