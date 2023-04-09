class UserApp {
  String? _idUsuario;
  String? _nome;
  String? _email;
  String? _senha;
  String? _nomeUsuario;

  UserApp();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome" : _nome,
      "email" : _email,
      'nomeUsuario' : _nomeUsuario
    };
    return map;
  }

  String? get idUsuario => _idUsuario;

  set idUsuario(String? value) {
    _idUsuario = value;
  }

  String? get senha => _senha;

  set senha(String? value) {
    this._senha = value;
  }

  String? get email => _email;

  set email(String? value) {
    this._email = value;
  }

  String? get nome => _nome;

  set nome(String? value) {
    this._nome = value;
  }

  String? get nomeUsuario => _nome;

  set nomeUsuario(String? value) {
    this._nomeUsuario = value;
  }
}