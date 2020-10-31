import 'dart:convert';

BonificacionModel bonificacionModelFromJson(String str) =>
    BonificacionModel.fromJson(json.decode(str));

String bonificacionModelToJson(BonificacionModel data) =>
    json.encode(data.toJson());

class BonificacionModel {
  BonificacionModel({
    //this.cantidad,
    //this.nombre,
    this.bonificaciones,
  });

  Map<String, dynamic> bonificaciones;
  //int cantidad;
  //String nombre;

  factory BonificacionModel.fromJson(Map<String, dynamic> json) =>
      BonificacionModel(
        //cantidad: json["cantidad"],
        //nombre: json["nombre"],
        bonificaciones: json["Bonificacion"],
      );

  Map<String, dynamic> toJson() => {
        //"cantidad": cantidad,
        //"nombre": nombre,
        "bonificaciones": bonificaciones
      };
}
