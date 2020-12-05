import 'dart:convert';

import 'contrato.dart';
import 'detalle_bp.dart';

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
    this.dni,
    this.contrato,
    this.boletapago,
  });

  String nombre;
  String apellido;
  int edad;
  double sueldo;
  String password;
  String dni;
  ContratoModel contrato;
  BoletadePago boletapago;

  factory TrabajadorModel.fromJson(Map<dynamic, dynamic> json) {
    if (json["Contrato"] != null) {
      print(json["boletapago"]);
      return (TrabajadorModel(
        nombre: json["nombre"],
        apellido: json["Apellido"],
        edad: json["edad"],
        sueldo: json["sueldo"],
        password: json["password"],
        dni: json["dni"],
        contrato: ContratoModel.fromJson(json["Contrato"]["001"]),
        boletapago: BoletadePago.fromJson(json["boletapago"][0]),
      ));
    } else {
      return (TrabajadorModel(
        nombre: json["nombre"],
        apellido: json["Apellido"],
        edad: json["edad"],
        sueldo: json["sueldo"],
        password: json["password"],
        dni: json["dni"],
      ));
    }
  }

  Map<String, dynamic> toJson() => {
        dni: {
          "nombre": nombre,
          "Apellido": apellido,
          "edad": edad,
          "sueldo": sueldo,
          "password": password,
        }
      };
  List<TrabajadorModel> lista(Map<dynamic, dynamic> json) {
    List<TrabajadorModel> trabajadores = new List();
    print(json.keys);
    json.forEach((key, value) {
      value["dni"] = key;
      TrabajadorModel tratrabajador = new TrabajadorModel.fromJson(value);
      trabajadores.add(tratrabajador);
    });
    return trabajadores;
  }

  Map<String, dynamic> tojsonS(List<TrabajadorModel> lista) {
    Map<String, dynamic> a = {};
    for (TrabajadorModel i in lista) {
      a[i.dni] = {
        "nombre": i.nombre,
        "Apellido": i.apellido,
        "edad": i.edad,
        "sueldo": i.sueldo,
        "password": i.password,
        "boletapago": i.boletapago,
        "Contrato": i.contrato,
      };
    }
    return a;
  }
}
