import 'dart:convert';

import 'package:infowork/model/detalle_bp.dart';

BoletaPagoModel boletaPagoModelFromJson(String str) =>
    BoletaPagoModel.fromJson(json.decode(str));

String boletaPagoModelToJson(BoletaPagoModel data) =>
    json.encode(data.toJson());

class BoletaPagoModel {
  BoletaPagoModel({
    this.fecha,
    this.detalle,
  });

  String fecha;
  DetalleBpModel detalle;

  factory BoletaPagoModel.fromJson(Map<String, dynamic> json) =>
      BoletaPagoModel(
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() {
    return ({
      "0": {
        "fecha": fecha,
      }
    });
  }
}
