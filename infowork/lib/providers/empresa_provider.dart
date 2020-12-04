import 'dart:convert';

import 'package:flutter_string_encryption/flutter_string_encryption.dart';
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
      final cryptor = new PlatformStringCryptor();
      final salt = await cryptor.generateSalt();
      final key =
          "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";
      final empresaTemp = EmpresaModel.fromJson(decodeData);

      empresaTemp.password = await cryptor.decrypt(empresaTemp.password, key);

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

  Future<bool> actualizarEmpresa(EmpresaModel empresa) async {
    final url = '$_url/Empresa';
    final cryptor = new PlatformStringCryptor();
    final salt = await cryptor.generateSalt();
    final key =
        "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";
    empresa.password = await cryptor.encrypt(empresa.password, key);
    final resp = await http.put(
      url + "/" + empresa.nombre + ".json",
      body: empresaModelToJson(empresa),
    );
    empresa.password = await cryptor.decrypt(empresa.password, key);
    final decodedData = json.decode(resp.body);

    print(decodedData);
    return true;
  }

  Future<bool> eliminarEmpresa(String empresa) async {
    final url = '$_url/Empresa';
    final resp = await http.delete(url + "/" + empresa + ".json");
    print(json.decode(resp.body));
    return true;
  }

  Future<bool> actualizarsalud(int index, String salud, String empresa) async {
    final url = '$_url/Empresa';
    final resp = await http.put(
      url + "/" + empresa + "/" + "salud" + "/" + index.toString() + ".json",
      body: json.encode(salud),
    );
    print(json.decode(resp.body));
    return true;
  }

  Future<bool> crearsalud(List<String> salud, String empresa) async {
    final url = '$_url/Empresa';
    final resp = await http.put(
      url + "/" + empresa + "/" + "salud" + ".json",
      body: json.encode(List<dynamic>.from(salud.map((x) => x))),
    );
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<bool> eliminarsalud(int index, String empresa) async {
    final url = '$_url/Empresa';
    final resp = await http.delete(
      url + "/" + empresa + "/" + "salud" + "/" + index.toString() + ".json",
    );
    print(json.decode(resp.body));
    return true;
  }
}
