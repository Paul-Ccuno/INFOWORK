import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/components/seassioncard.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final String nombre;
  final String apellido;
  final int edad;
  final double sueldo;
  const Body({
    Key key,
    this.nombre,
    this.apellido,
    this.edad,
    this.sueldo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          // Here the height of the container is 45% of our total height
          height: size.height * .20,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/images/equipo.svg"),
                  ),
                ),
                Text(
                  "Datos del \nEmpleado",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  padding: new EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Wrap(
                    spacing: 50,
                    runSpacing: 40,
                    children: <Widget>[
                      SeassionCard(
                        nombre: "Nombre",
                        isDone: true,
                        image: "assets/images/identificacion.svg",
                        valor: this.nombre,
                      ),
                      SeassionCard(
                        nombre: "Apellido",
                        isDone: true,
                        image: "assets/images/identificacion.svg",
                        valor: this.apellido,
                      ),
                      SeassionCard(
                        nombre: "Edad",
                        isDone: true,
                        image: "assets/images/pastel-de-cumpleanos.svg",
                        valor: this.edad.toString(),
                      ),
                      SeassionCard(
                        nombre: "Sueldo",
                        isDone: true,
                        image: "assets/images/hucha.svg",
                        valor: this.sueldo.toString(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
