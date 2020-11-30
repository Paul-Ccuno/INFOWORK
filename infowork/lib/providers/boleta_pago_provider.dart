import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infowork/model/detalle_bp.dart';

class BoletaProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<BoletadePago> cargarBoleta(empresa, usuario) async {
    final url = '$_url/Empresa/' +
        empresa +
        '/Trabajador/' +
        usuario +
        '/boletapago/0.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      print("Asd");
      return null;
    } else {
      final detalleBPTemp = BoletadePago.fromJson(decodeData);
      print(detalleBPTemp);
      return detalleBPTemp;
    }
  }
}
