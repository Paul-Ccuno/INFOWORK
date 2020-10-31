import 'dart:convert';

import 'package:infowork/model/detalle_bp.dart';
import 'package:http/http.dart' as http;

class DetalleBPProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<String> cargarDetalleBP() async {
    final url =
        '$_url/Empresa/Movistar/Trabajador/joselipa123ochoa123/boletapago/B0001/detalle.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return "";
    } else {
      final detalleBPTemp = DetalleBPModel.fromJson(decodeData);
      print(detalleBPTemp.monto);
      return detalleBPTemp.bonificaciones.toString();
    }
  }
}
