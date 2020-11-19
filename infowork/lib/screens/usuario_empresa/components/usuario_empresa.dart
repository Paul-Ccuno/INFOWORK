import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/login/components/login_screen.dart';
import 'package:infowork/screens/usuario_empresa/components/curvedwidget.dart';
import 'package:infowork/screens/usuario_empresa/components/register_login_empresa.dart';

import '../../../constans.dart';

class UsuarioEmpresa extends StatelessWidget {
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
        child: Stack(
          children: <Widget>[
            CurvedWidget(
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 20),
                width: double.infinity,
                height: 300,
                decoration: boxdecoration,
                child: Text(
                  "¿Eres una empresa\no un trabajador?",
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
              child: Wrap(
                spacing: 50,
                runSpacing: 40,
                children: <Widget>[
                  Text(
                    "Empresa",
                    style: TextStyle(fontSize: 18),
                  ),
                  OptionRow(
                    image: "assets/images/empresa.svg",
                    titulo: "Empresa",
                    descripcion:
                        "Administra tus trabajadores\nAtiende sus reclamos\nInforma tus normas",
                    destino: EmpresaRegisterLogin(),
                  ),
                  Text(
                    "Trabajador",
                    style: TextStyle(fontSize: 18),
                  ),
                  OptionRow(
                    image: "assets/images/trabajador.svg",
                    titulo: "Trabajador",
                    descripcion:
                        "Informate de tu contrato\nInformate de tus derechos\ny obligaciones\nVisualiza tu boleta\nde pago",
                    destino: LoginScreen(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionRow extends StatelessWidget {
  final String image;
  final String titulo;
  final String descripcion;
  final StatelessWidget destino;
  const OptionRow(
      {Key key, this.image, this.titulo, this.descripcion, this.destino})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final optioncard = Container(
      margin: const EdgeInsets.only(left: 46.0),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => destino,
              ),
            );
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  this.descripcion,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.white),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            height: 124.0,
            width: 10000,
          ),
        ),
        color: Colors.transparent,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xFF3362F3),
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            offset: new Offset(0.0, 10.0),
            blurRadius: 10.0,
          )
        ],
      ),
      padding: EdgeInsets.all(10),
    );
    final planetImage = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new SvgPicture.asset(
        this.image,
        height: 92.0,
        width: 92.0,
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 2),
      child: new Stack(
        children: <Widget>[
          optioncard,
          planetImage,
        ],
      ),
    );
  }
}
