import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/components/rounded_button.dart';
import 'package:infowork/components/text_field_container.dart';
import 'package:infowork/screens/login/components/login_screen.dart';
import 'package:infowork/screens/menu/components/menu_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final TextEditingController empresacontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController contrasenacontroller = TextEditingController();

    Size size = MediaQuery.of(context).size;

    if (firebaseUser != null) {
      return MenuScreen();
    } else {
      return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/images/equipo.svg",
                  height: size.height * 0.30,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: empresacontroller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.business),
                      hintText: "Nombre de la empresa",
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Correo del trabajador",
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: contrasenacontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Constraseña",
                    ),
                  ),
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {
                    var email = emailcontroller.text.trim();
                    var password = contrasenacontroller.text.trim();
                    var empresa = empresacontroller.text.trim();
                    if (email != "" && password != "" && empresa != "") {
                      try {
                        context.read<AuthenticationService>().signIn(
                              email: emailcontroller.text.trim(),
                              password: contrasenacontroller.text.trim(),
                            );
                      } on FirebaseAuthException catch (e) {
                        return null;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Colors.lightBlue[800],
                Colors.blue[600],
                Colors.blue[700],
                Colors.blue[800]
              ],
            ),
          ),
        ),
      );
    }
  }
}
