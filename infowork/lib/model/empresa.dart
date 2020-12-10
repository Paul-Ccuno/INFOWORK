import 'dart:convert';

import 'package:infowork/model/trabajador.dart';

EmpresaModel empresaModelFromJson(String str) =>
    EmpresaModel.fromJson(json.decode(str));
String empresaModelToJson(EmpresaModel data) => json.encode(data.toJson());

class EmpresaModel {
  EmpresaModel({
    this.trabajador,
    this.direccion,
    this.nombre,
    this.plan,
    this.normas,
    this.salud,
    this.password,
  });
  List<TrabajadorModel> trabajador;
  String direccion;
  String nombre;
  String plan;
  String password;
  List<String> normas;
  List<String> salud;

  factory EmpresaModel.fromJson(Map<String, dynamic> json) {
    TrabajadorModel a = new TrabajadorModel();
    return (EmpresaModel(
      trabajador:
          json["Trabajador"] != null ? a.lista(json["Trabajador"]) : null,
      direccion: json["direccion"],
      nombre: json["nombre"],
      plan: json["plan"],
      password: json["password"],
      normas: json["normas"] != null
          ? List<String>.from(json["normas"].map((x) => x))
          : null,
      salud: json["salud"] != null
          ? List<String>.from(json["salud"].map((x) => x))
          : null,
    ));
  }

  Map<String, dynamic> toJson() {
    TrabajadorModel a = new TrabajadorModel();
    return ({
      "Trabajador": trabajador != null ? a.tojsonS(trabajador) : null,
      "direccion": direccion,
      "nombre": nombre,
      "plan": plan,
      "password": password,
      "normas":
          normas != null ? List<dynamic>.from(normas.map((x) => x)) : null,
      "salud": salud != null ? List<dynamic>.from(salud.map((x) => x)) : null,
    });
  }
}
