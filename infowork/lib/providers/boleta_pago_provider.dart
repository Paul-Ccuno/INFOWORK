import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infowork/model/boleta_pago.dart';

class BoletaPagoProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<String> cargarBoletaPago() async {
    final url =
        '$_url/Empresa/Movistar/Trabajador/joselipa123ochoa123/boletapago/B0001.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return "";
    } else {
      final boletaPagoTemp = BoletaPagoModel.fromJson(decodeData);
      print(boletaPagoTemp.fecha);
      return boletaPagoTemp.fecha;
    }
  }
}
