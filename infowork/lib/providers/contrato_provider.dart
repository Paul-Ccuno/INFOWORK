import 'dart:convert';

import 'package:infowork/model/contrato.dart';
import 'package:http/http.dart' as http;

class ContratoProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<ContratoModel> cargarContrato(empresa, usuario) async {
    final url = '$_url/Empresa/' +
        empresa +
        '/Trabajador/' +
        usuario +
        '/Contrato/001.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return null;
    } else {
      final contratoTemp = ContratoModel.fromJson(decodeData);
      return contratoTemp;
    }
  }
}
