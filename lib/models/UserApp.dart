
class UserApp{
  String? idUser;
  String? name;
  String? email;
  String? password;
  String? nickName;

  UserApp({this.idUser,this.name,this.email,this.password,this.nickName});

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'nome' : name,
      'email' : email,
      'nomeUsuario' : nickName
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