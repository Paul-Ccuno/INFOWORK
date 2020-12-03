import 'dart:convert';

ContratoModel contratoModelFromJson(String str) =>
    ContratoModel.fromJson(json.decode(str));

String contratoModelToJson(ContratoModel data) => json.encode(data.toJson());

class ContratoModel {
  ContratoModel({
    this.clausulas,
    this.declaraciones,
    this.fechaEmision,
    this.fechaVencimiento,
  });

  List<dynamic> clausulas;
  List<dynamic> declaraciones;
  String fechaEmision;
  String fechaVencimiento;

  factory ContratoModel.fromJson(Map<String, dynamic> json) => ContratoModel(
        clausulas: json["Clausulas"],
        declaraciones: json["Declaraciones"],
        fechaEmision: json["fecha_emision"],
        fechaVencimiento: json["fecha_vencimiento"],
      );

  Map<String, dynamic> toJson() {
    return ({
      "001": {
        "Clausulas": clausulas,
        "Declaraciones": declaraciones,
      },
      "fecha_emision": fechaEmision,
      "fecha_vencimiento": fechaVencimiento,
    });
  }
}
