import 'dart:convert';

class Product {
  Product({
    this.azucarEnPorcion,
    this.carbohidratosEnPorcion,
    this.codigoBarras,
    this.contenidoEnergetico,
    this.createdAt,
    this.grasasEnPorcion,
    this.id,
    this.idCategoria,
    this.idMarca,
    this.nombre,
    this.numeroPorciones,
    this.proteinasEnPorcion,
    this.tamanioEnvase,
    this.tamanioPorcion,
    this.unidadMedida,
    this.urlImagen,
  });

  double? azucarEnPorcion;
  double? carbohidratosEnPorcion;
  String? codigoBarras;
  double? contenidoEnergetico;
  String? createdAt;
  double? grasasEnPorcion;
  int? id;
  int? idCategoria;
  int? idMarca;
  String? nombre;
  int? numeroPorciones;
  double? proteinasEnPorcion;
  String? tamanioEnvase;
  String? tamanioPorcion;
  String? unidadMedida;
  String? urlImagen;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        azucarEnPorcion: json["azucar_en_porcion"] != null
            ? double.parse(json["azucar_en_porcion"])
            : json["azucar_en_porcion"],
        carbohidratosEnPorcion: json["carbohidratos_en_porcion"] != null
            ? double.parse(json["carbohidratos_en_porcion"])
            : json["carbohidratos_en_porcion"],
        codigoBarras: json["codigo_barras"],
        contenidoEnergetico: json["contenido_energetico"] != null
            ? double.parse(json["contenido_energetico"])
            : json["contenido_energetico"],
        createdAt: json["created_at"],
        grasasEnPorcion: json["grasas_en_porcion"] != null
            ? double.parse(json["grasas_en_porcion"])
            : json["grasas_en_porcion"],
        id: json["id"],
        idCategoria: json["id_categoria"],
        idMarca: json["id_marca"],
        nombre: json["nombre"],
        numeroPorciones: json["numero_porciones"],
        proteinasEnPorcion: json["proteinas_en_porcion"] != null
            ? double.parse(json["proteinas_en_porcion"])
            : json["proteinas_en_porcion"],
        tamanioEnvase: json["tamanio_envase"],
        tamanioPorcion: json["tamanio_porcion"],
        unidadMedida: json["unidad_medida"],
        urlImagen: json["url_imagen"],
      );

  Map<String, dynamic> toMap() => {
        "azucar_en_porcion": azucarEnPorcion,
        "carbohidratos_en_porcion": carbohidratosEnPorcion,
        "codigo_barras": codigoBarras,
        "contenido_energetico": contenidoEnergetico,
        "created_at": createdAt,
        "grasas_en_porcion": grasasEnPorcion,
        "id": id,
        "id_categoria": idCategoria,
        "id_marca": idMarca,
        "nombre": nombre,
        "numero_porciones": numeroPorciones,
        "proteinas_en_porcion": proteinasEnPorcion,
        "tamanio_envase": tamanioEnvase,
        "tamanio_porcion": tamanioPorcion,
        "unidad_medida": unidadMedida,
        "url_imagen": urlImagen,
      };
}
