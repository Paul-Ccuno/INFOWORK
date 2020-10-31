import 'dart:convert';

DetalleBPModel detalleBPModelFromJson(String str) =>
    DetalleBPModel.fromJson(json.decode(str));

String detalleBPModelToJson(DetalleBPModel data) => json.encode(data.toJson());

class DetalleBPModel {
  DetalleBPModel({
    //this.cantidad,
    //this.nombre,
    this.bonificaciones,
    this.descuentos,
    this.monto,
  });

  Map<String, dynamic> bonificaciones;
  Map<String, dynamic> descuentos;
  int monto;
  //int cantidad;
  //String nombre;

  factory DetalleBPModel.fromJson(Map<String, dynamic> json) => DetalleBPModel(
        //cantidad: json["cantidad"],
        //nombre: json["nombre"],
        bonificaciones: json["Bonificacion"],
        descuentos: json["Descuento"],
        monto: json["monto"],
      );

  Map<String, dynamic> toJson() => {
        //"cantidad": cantidad,
        //"nombre": nombre,
        "bonificaciones": bonificaciones,
        "descuentos": descuentos,
        "monto": monto,
      };
}
