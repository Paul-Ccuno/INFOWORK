import 'dart:convert';

EmpresaModel empresaModelFromJson(String str) =>
    EmpresaModel.fromJson(json.decode(str));

String empresaModelToJson(EmpresaModel data) => json.encode(data.toJson());

class EmpresaModel {
  EmpresaModel({
    this.nombre,
    this.direccion,
  });

  String nombre;
  String direccion;

  factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        nombre: json["nombre"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "direccion": direccion,
      };
}
