import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/screens/usuario_empresa/components/usuario_empresa.dart';

class MainDrawEmpresa extends StatelessWidget {
  final EmpresaModel empresaModel;

  const MainDrawEmpresa({Key key, this.empresaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      "assets/images/logo_job.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Perfil"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("Sueldo"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.file_copy_rounded),
          title: Text("Contrato"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.local_hospital_rounded),
          title: Text("Salud"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.content_paste),
          title: Text("Normas"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.business),
          title: Text("Reclamo"),
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text("Salir"),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UsuarioEmpresa(),
              ),
            );
          },
        ),
      ],
    ));
  }
}
