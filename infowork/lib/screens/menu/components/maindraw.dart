import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/login/components/login_screen.dart';
import 'package:infowork/screens/perfil/perfil_screen.dart';
import 'package:provider/provider.dart';

class MainDraw extends StatelessWidget {
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
                builder: (context) => PerfilScreen(),
              ),
            );
          },
        ),
        ListTile(leading: Icon(Icons.monetization_on), title: Text("Sueldo")),
        ListTile(
            leading: Icon(Icons.file_copy_rounded), title: Text("Contrato")),
        ListTile(
            leading: Icon(Icons.local_hospital_rounded), title: Text("Salud")),
        ListTile(leading: Icon(Icons.content_paste), title: Text("Normas")),
        ListTile(leading: Icon(Icons.business), title: Text("Reglamento I.")),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text("Salir"),
          onTap: () {
            context.read<AuthenticationService>().signOut();
          },
        ),
      ],
    ));
  }
}
