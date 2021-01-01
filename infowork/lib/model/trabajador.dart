import 'dart:convert';

import 'contrato.dart';
import 'detalle_bp.dart';

TrabajadorModel trabajadorModelFromJson(String str) =>
    TrabajadorModel.fromJson(json.decode(str));

String trabajadorModelToJson(TrabajadorModel data) =>
    json.encode(data.toJson());
class MensajeModel{
  String fecha;
  String autor;
  String mensaje;
  MensajeModel({
    this.autor,
    this.mensaje,
    this.fecha
  });
  factory MensajeModel.fromJson(Map<dynamic,dynamic> json){
    print("asdss");
    return MensajeModel(
      fecha: json["fecha"],
      autor: json["autor"],
      mensaje: json["mensaje"]
    );
  }
  List<MensajeModel> listamensajes(json){
    List<MensajeModel> mensajes = new List();
    for(var variable in json){
      mensajes.add(MensajeModel(
        autor: variable["autor"],
        fecha: variable["tiempo"],
        mensaje: variable["mensaje"]
      ));
    }
    return mensajes;
  }
}

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
    this.mensajes
  });

  String nombre;
  String apellido;
  int edad;
  double sueldo;
  String password;
  String dni;
  ContratoModel contrato;
  BoletadePago boletapago;
  List<MensajeModel> mensajes;

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
      MensajeModel mensajes= new MensajeModel();
      return (TrabajadorModel(
        nombre: json["nombre"],
        apellido: json["Apellido"],
        edad: json["edad"],
        sueldo: json["sueldo"],
        password: json["password"],
        dni: json["dni"],
        mensajes: json["mensajes"]!=null? mensajes.listamensajes(json["mensajes"]):null
      ));
    }
  }
  Map<String, dynamic> toJson1() {
    return ({
      "nombre": nombre,
      "Apellido": apellido,
      "edad": edad,
      "sueldo": sueldo,
      "password": password,
    });
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
      print("ASD");
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
