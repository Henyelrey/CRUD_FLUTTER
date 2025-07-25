import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UsuarioModelo {
  late final String user;
  late final String clave;
  late final String rol;


  UsuarioModelo({
    required this.user,
    required this.clave,
    required this.rol,

  });

  UsuarioModelo.login(this.user, this.clave);
  UsuarioModelo.loginDos(this.user, this.clave):rol="";

  factory UsuarioModelo.fromJson(Map<String, dynamic> json){
    return UsuarioModelo(
      user : json['user'],
      clave : json['clave'],
      rol : json['rol'],

    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['clave'] = clave;
    _data['rol'] = rol;
    return _data;
  }
}

class UsuarioLogin {
  UsuarioLogin({
    required this.user,
    required this.clave,
  });

  late final String user;
  late final String clave;

  UsuarioLogin.login(this.user, this.clave);

  factory UsuarioLogin.fromJson(Map<String, dynamic> json){
    return UsuarioLogin(
      user: json["user"],
      clave: json["clave"],
    );
  }

  Map<String, dynamic> toJson() => {
    "user": user,
    "clave": clave,
  };

}


class UsuarioResp {
  UsuarioResp({
    required this.idUsuario,
    required this.user,

    required this.token,
  });

  late final int idUsuario;
  late final String user;

  late final String token;

  factory UsuarioResp.fromJson(Map<String, dynamic> json){
    return UsuarioResp(
      idUsuario: json["idUsuario"],
      user: json["user"],

      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "idUsuario": idUsuario,
    "user": user,

    "token": token,
  };

  @override
  String toString(){
    return "$idUsuario, $user, $token, ";
  }
}