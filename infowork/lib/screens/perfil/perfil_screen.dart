import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infowork/providers/empresa.dart';

class PerfilScreen extends StatelessWidget {
  final empresaProvider = new EmpresaProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _empresadatos(),
    );
  }

  Widget _empresadatos() {
    return FutureBuilder(
      future: empresaProvider.cargarEmpresa(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
