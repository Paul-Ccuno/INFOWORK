import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/providers/tabajador_provider.dart';
import 'package:infowork/screens/menu/components/menu_screen.dart';
import 'package:infowork/screens/usuario_empresa/components/curvedwidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final empresaProvider = new EmpresaProvider();
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      print(firebaseUser.email);
      return MenuScreen();
    } else {
      return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            CurvedWidget(
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 20),
                width: double.infinity,
                height: 300,
                decoration: boxdecoration,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.fromLTRB(20, 280, 20, 10),
              child: Column(
                children: <Widget>[
                  LoginFormUser(),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

/*
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
                ),*/
class LoginFormUser extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginFormUser> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _empresaController = TextEditingController();
  final TrabajadorProviderPrueba trabjador = TrabajadorProviderPrueba();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _empresaController,
          decoration: InputDecoration(
            icon: Icon(
              Icons.work,
            ),
            labelText: "Empresa en la que trabajas",
          ),
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.always,
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: "DNI del trabajador",
          ),
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.always,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "Password",
          ),
          obscureText: true,
          autovalidateMode: AutovalidateMode.always,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: MaterialButton(
            onPressed: () {
              var email = _emailController.text.trim();
              var password = _passwordController.text.trim();
              var empresa = _empresaController.text.trim();
              if (email != "" && password != "" && empresa != "") {
                trabjador.cargarTrabajador(empresa, email).then(
                  (value) async {
                    if (value == null) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Datos incorrectos"),
                        ),
                      );
                    } else {
                      final cryptor = new PlatformStringCryptor();
                      final salt = await cryptor.generateSalt();
                      final key =
                          "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";
                      String decrypter =
                          await cryptor.decrypt(value.password, key);
                      if (password == decrypter) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenuScreen(empresa: empresa, usuario: email),
                          ),
                        );
                      } else {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Contraseña incorrecta"),
                          ),
                        );
                      }
                    }
                  },
                );
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Rellena todos los campos"),
                  ),
                );
              }
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              colors: [Color(0xFF3362F3), Color(0XFF3967F2), Color(0xFF5079F3)],
            ),
          ),
          width: 130,
        ),
      ],
    );
  }
}
