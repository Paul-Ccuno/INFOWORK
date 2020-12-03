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
    if (json["Trabajador"] != null) {
      print(json.keys.where((element) {
        print(element);
        return true;
      }));
      print(json["Trabajador"]);
      TrabajadorModel a = new TrabajadorModel();
      return (EmpresaModel(
        /*trabajador: List<TrabajadorModel>.from(
          json.keys.map((x) => TrabajadorModel.fromJson(json)),
        ),*/
        trabajador: a.lista(json["Trabajador"]),
        direccion: json["direccion"],
        nombre: json["nombre"],
        plan: json["plan"],
        password: json["password"],
        normas: List<String>.from(json["normas"].map((x) => x)),
        salud: List<String>.from(json["salud"].map((x) => x)),
      ));
    } else {
      return (EmpresaModel(
        direccion: json["direccion"],
        nombre: json["nombre"],
        plan: json["plan"],
        password: json["password"],
      ));
    }
  }

  Map<String, dynamic> toJson() {
    if (this.trabajador != null) {
      TrabajadorModel a = new TrabajadorModel();
      Map<String, dynamic> ac = a.tojsonS(trabajador);
      print(ac);
      return ({
        "Trabajador": ac,
        "direccion": direccion,
        "nombre": nombre,
        "plan": plan,
        "password": password,
        "normas": List<dynamic>.from(normas.map((x) => x)),
        "salud": List<dynamic>.from(salud.map((x) => x)),
      });
    } else {
      return ({
        "nombre": nombre,
        "direccion": direccion,
        "plan": plan,
        "password": password,
      });
    }
  }
}
