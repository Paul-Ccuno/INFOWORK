import 'package:flutter/material.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/screens/usuario_empresa/components/curvedwidget.dart';

import '../../../constans.dart';

class TrabajadorRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                    "Register",
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
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _nombreEmpresa = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  EmpresaProvider empresaProvider = new EmpresaProvider();
  EmpresaModel empresamodel = new EmpresaModel();
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
          controller: _direccionController,
          decoration: InputDecoration(
            icon: Icon(Icons.map),
            labelText: "Direccion de la empresa",
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
            onPressed: () {
              var direccion = _direccionController.text.trim();
              var password = _passwordController.text.trim();
              var empresa = _nombreEmpresa.text.trim();
              if (direccion != "" && password != "" && empresa != "") {
                /*empresamodel.nombre = empresa;
                empresamodel.plan = "gratis";
                empresamodel.direccion = direccion;
                empresaProvider
                    .cargarEmpresa(empresamodel.nombre)
                    .then((value) {
                  if (value == null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("La empresa ya esta registrada"),
                      ),
                    );
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("La empresa ya esta registrada"),
                      ),
                    );
                  }
                });*/
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Rellene todos los campos"),
                  ),
                );
              }
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );*/
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
