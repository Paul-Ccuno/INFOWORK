import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/providers/tabajador_provider.dart';

class PerfilScreen extends StatelessWidget {
  final empresaProvider = new EmpresaProvider();
  final trabajadorProvider = new TrabajadorProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _empresadatos(),
    );
  }

  Widget _empresadatos() {
    return FutureBuilder(
      future: trabajadorProvider.cargarTrabajador(),
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
