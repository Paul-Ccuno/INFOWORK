import 'dart:convert';

import 'package:infowork/model/bonificacion.dart';
import 'package:http/http.dart' as http;

class BonificacionProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<String> cargarBonificacion() async {
    final url =
        '$_url/Empresa/Movistar/Trabajador/joselipa123ochoa123/boletapago/B0001/detalle.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return "";
    } else {
      final bonificacionTemp = BonificacionModel.fromJson(decodeData);
      print(bonificacionTemp.bonificaciones);
      return bonificacionTemp.bonificaciones.toString();
    }
  }
}
