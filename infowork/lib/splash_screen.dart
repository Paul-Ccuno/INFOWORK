import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/usuario_empresa/components/usuario_empresa.dart';

import 'constans.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 5000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UsuarioEmpresa(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              Container(
                child: Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: .8,
                  child: SvgPicture.asset(
                    "assets/images/splash_log.svg",
                    width: 450,
                  ),
                ),
              ),
              Text(
                "INFOWORK",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Spacer(),
              Container(
                child: Text(
                  "Aplicacion para\nEmpresas y trabajadores",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.symmetric(vertical: 25),
              ),
            ],
          ),
        ),
        decoration: boxdecoration,
      ),
    );
  }
}
