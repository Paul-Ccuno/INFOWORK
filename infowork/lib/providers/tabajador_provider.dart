import 'dart:convert';

import 'package:infowork/model/trabajador.dart';
import 'package:http/http.dart' as http;

class TrabajadorProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<TrabajadorModel> cargarTrabajador() async {
    final url = '$_url/Empresa/Movistar/Trabajador/joselipa123ochoa123.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return null;
    } else {
      final trabajadorTemp = TrabajadorModel.fromJson(decodeData);
      return trabajadorTemp;
    }
  }
}
