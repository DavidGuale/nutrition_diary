import 'dart:convert';

class Registro {
  Registro({
    this.idProducto,
    this.idUsuario,
    this.comida,
    this.porcion,
  });

  int? idProducto;
  int? idUsuario;
  int? comida;
  double? porcion;

  factory Registro.fromJson(String str) => Registro.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Registro.fromMap(Map<String, dynamic> json) => Registro(
        idProducto: json["id_producto"],
        idUsuario: json["id_usuario"],
        porcion: json["comida"],
        comida: json["porcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_producto": idProducto,
        "id_usuario": idUsuario,
        "comida": comida,
        "porcion": porcion,
      };
}
