import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/Chat/Components/chat.dart';
import 'package:infowork/screens/contrato/components/contrato_screen.dart';
import 'package:infowork/screens/salud/components/salud.dart';
import 'package:infowork/screens/normas/components/normas_screen.dart';
import 'package:infowork/screens/perfil/components/perfil_screen.dart';
import 'package:infowork/screens/sueldo/components/sueldo_screen.dart';
import 'package:infowork/screens/usuario_empresa/components/usuario_empresa.dart';

class MainDraw extends StatelessWidget {
  final String empresa;
  final String usuario;

  const MainDraw({Key key, this.empresa, this.usuario}) : super(key: key);
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerfilScreen(
                  empresa: this.empresa,
                  usuario: this.usuario,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text("Sueldo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SueldoScreen(
                  empresa: this.empresa,
                  usuario: this.usuario,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.file_copy_rounded),
          title: Text("Contrato"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContratoScreen(
                  empresa: this.empresa,
                  usuario: this.usuario,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.local_hospital_rounded),
          title: Text("Salud"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaludScreen(
                  empresa: this.empresa,
                  usuario: this.usuario,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.content_paste),
          title: Text("Normas"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NormaScreen(
                  empresa: this.empresa,
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.business),
          title: Text("Reclamo"),
          onTap: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  empresa: this.empresa,
                ),
              ),
            );
          },
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
