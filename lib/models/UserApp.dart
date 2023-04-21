
class UserApp{
  String? idUsuario;
  String? nome;
  String? email;
  String? senha;
  String? nomeUsuario;

  UserApp({this.idUsuario,this.nome,this.email,this.senha,this.nomeUsuario});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'nome' : nome,
      'email' : email,
      'nomeUsuario' : nomeUsuario
    };
    return map;
  }

  // String? get idUsuario => _idUsuario;
  //
  // set idUsuario(String? value) {
  //   _idUsuario = value;
  // }
  //
  // String? get senha => _senha;
  //
  // set senha(String? value) {
  //   this._senha = value;
  // }
  //
  // String? get email => _email;
  //
  // set email(String? value) {
  //   this._email = value;
  // }
  //
  // String? get nome => _nome;
  //
  // set nome(String? value) {
  //   this._nome = value;
  // }
  //
  // String? get nomeUsuario => _nome;
  //
  // set nomeUsuario(String? value) {
  //   this._nomeUsuario = value;
  // }
}