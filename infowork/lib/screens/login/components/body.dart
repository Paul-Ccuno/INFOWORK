import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/components/rounded_button.dart';
import 'package:infowork/components/text_field_container.dart';
import 'package:infowork/screens/menu/components/menu_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  decoration: InputDecoration(
                    icon: Icon(Icons.business),
                    hintText: "Nombre de la empresa",
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "DNI del trabajador",
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MenuScreen();
                      },
                    ),
                  );
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
