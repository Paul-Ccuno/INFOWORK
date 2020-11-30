import 'dart:convert';

TrabajadorModel trabajadorModelFromJson(String str) =>
    TrabajadorModel.fromJson(json.decode(str));

String trabajadorModelToJson(TrabajadorModel data) =>
    json.encode(data.toJson());

class TrabajadorModel {
  TrabajadorModel({
    this.nombre,
    this.apellido,
    this.edad,
    this.sueldo,
    this.password,
  });

  String nombre;
  String apellido;
  int edad;
  double sueldo;
  String password;

  factory TrabajadorModel.fromJson(Map<String, dynamic> json) =>
      TrabajadorModel(
          nombre: json["nombre"],
          apellido: json["Apellido"],
          edad: json["edad"],
          sueldo: json["sueldo"],
          password: json["password"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "edad": edad,
        "sueldo": sueldo,
        "password": password,
      };
}
