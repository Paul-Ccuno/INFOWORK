import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/screens/usuario_empresa/components/Register.dart';
import 'package:infowork/screens/usuario_empresa/components/curvedwidget.dart';

import '../../../constans.dart';

class EmpresaRegisterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
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
                    LoginForm(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  EmpresaModel empresaModel = new EmpresaModel();
  EmpresaProvider empresaProvider = new EmpresaProvider();
  final TextEditingController _nombreEmpresa = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _nombreEmpresa,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: "Nombre de la empresa",
          ),
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
            onPressed: () async {
              String nombre = _nombreEmpresa.text.trim();
              String password = _passwordController.text.trim();
              if (nombre != "" && password != "") {
                empresaModel.nombre = nombre;
                empresaProvider
                    .cargarEmpresa(empresaModel.nombre)
                    .then((value) async {
                  if (value != null) {
                    final cryptor = new PlatformStringCryptor();
                    final salt = await cryptor.generateSalt();
                    final key =
                        "jIkj0VOLhFpOJSpI7SibjA==:RZ03+kGZ/9Di3PT0a3xUDibD6gmb2RIhTVF+mQfZqy0=";
                    String decrypter =
                        await cryptor.decrypt(value.password, key);
                    if (password == decrypter) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Logueado"),
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Contraseña incorrecta"),
                        ),
                      );
                    }
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Empresa no existe"),
                      ),
                    );
                  }
                });
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
        SizedBox(
          height: 10,
        ),
        Container(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Register',
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
