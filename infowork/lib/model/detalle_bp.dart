import 'dart:convert';

BoletadePago boletadePagoFromJson(String str) =>
    BoletadePago.fromJson(json.decode(str));

String boletadePagoToJson(BoletadePago data) => json.encode(data.toJson());

class BoletadePago {
  BoletadePago({
    this.detalle,
    this.fecha,
    this.id,
  });

  DetalleBpModel detalle;
  String fecha;
  String id;

  factory BoletadePago.fromJson(Map<String, dynamic> json) => BoletadePago(
        detalle: DetalleBpModel.fromJson(json["detalle"]),
        fecha: json["fecha"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "detalle": detalle.toJson(),
        "fecha": fecha,
        "id": id,
      };
}

class DetalleBpModel {
  DetalleBpModel({
    this.bonificacion,
    this.descuento,
    this.monto,
  });

  List<Bonificacion> bonificacion;
  List<Bonificacion> descuento;
  double monto;

  factory DetalleBpModel.fromJson(Map<String, dynamic> json) => DetalleBpModel(
        bonificacion: List<Bonificacion>.from(
            json["Bonificacion"].map((x) => Bonificacion.fromJson(x))),
        descuento: List<Bonificacion>.from(
            json["Descuento"].map((x) => Bonificacion.fromJson(x))),
        monto: json["monto"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Bonificacion": List<dynamic>.from(bonificacion.map((x) => x.toJson())),
        "Descuento": List<dynamic>.from(descuento.map((x) => x.toJson())),
        "monto": monto,
      };
}

class Bonificacion {
  Bonificacion({
    this.cantidad,
    this.nombre,
  });

  int cantidad;
  String nombre;

  factory Bonificacion.fromJson(Map<String, dynamic> json) => Bonificacion(
        cantidad: json["cantidad"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "nombre": nombre,
      };
}
