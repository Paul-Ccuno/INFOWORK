import 'dart:convert';

import 'package:infowork/model/empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<String> cargarEmpresa() async {
    final url = '$_url/Empresa/Movistar.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return "";
    } else {
      final empresaTemp = EmpresaModel.fromJson(decodeData);
      print(empresaTemp.direccion);
      return empresaTemp.direccion;
    }
  }
}
