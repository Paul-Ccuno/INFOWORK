import 'dart:convert';

import 'package:infowork/model/empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaProvider {
  final String _url = 'https://infowork-7ce24.firebaseio.com';
  Future<EmpresaModel> cargarEmpresa(empresa) async {
    final url = '$_url/Empresa/' + empresa + '.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    if (decodeData == null) {
      return null;
    } else {
      final empresaTemp = EmpresaModel.fromJson(decodeData);
      print(empresaTemp.direccion);
      return empresaTemp;
    }
  }

  Future<bool> crearEmpresa(EmpresaModel empresa) async {
    final url = '$_url/Empresa';
    final resp = await http.post(url + "/" + empresa.nombre + ".json",
        body: empresaModelToJson(empresa));
    final resp1 = await http.put(url + "/" + empresa.nombre + ".json",
        body: empresaModelToJson(empresa));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
