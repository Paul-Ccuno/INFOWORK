import 'package:infowork/model/trabajador.dart';

class EmpresaModel {
  EmpresaModel({
    this.trabajador,
    this.direccion,
    this.nombre,
    this.plan,
    this.normas,
    this.salud,
  });

  TrabajadorModel trabajador;
  String direccion;
  String nombre;
  String plan;
  List<String> normas;
  List<String> salud;

  factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        trabajador: TrabajadorModel.fromJson(json["Trabajador"]),
        direccion: json["direccion"],
        nombre: json["nombre"],
        plan: json["plan"],
        normas: List<String>.from(json["normas"].map((x) => x)),
        salud: List<String>.from(json["salud"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Trabajador": trabajador.toJson(),
        "direccion": direccion,
        "nombre": nombre,
        "plan": plan,
        "normas": List<dynamic>.from(normas.map((x) => x)),
        "salud": List<dynamic>.from(salud.map((x) => x)),
      };
}
