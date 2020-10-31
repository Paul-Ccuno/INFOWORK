import 'dart:convert';

BoletaPagoModel boletaPagoModelFromJson(String str) =>
    BoletaPagoModel.fromJson(json.decode(str));

String boletaPagoModelToJson(BoletaPagoModel data) =>
    json.encode(data.toJson());

class BoletaPagoModel {
  BoletaPagoModel({
    this.fecha,
  });

  String fecha;

  factory BoletaPagoModel.fromJson(Map<String, dynamic> json) =>
      BoletaPagoModel(
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
      };
}
