import 'package:flutter/material.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/providers/tabajador_provider.dart';
import 'package:infowork/screens/perfil/components/body.dart';

class PerfilScreen extends StatelessWidget {
  final trabajadorProvider = new TrabajadorProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _datosempleado(),
    );
  }

  Widget _datosempleado() {
    return FutureBuilder(
      future: trabajadorProvider.cargarTrabajador(),
      builder: (BuildContext context, AsyncSnapshot<TrabajadorModel> snapshot) {
        if (snapshot.hasData) {
          return Body(
            nombre: snapshot.data.nombre,
            apellido: snapshot.data.apellido,
            edad: snapshot.data.edad,
            sueldo: snapshot.data.sueldo,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
