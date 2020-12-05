import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final String nombre;
  final String direccion;
  final String plan;
  final String password;

  const Body({
    Key key,
    this.nombre,
    this.direccion,
    this.plan,
    this.password,
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
                  "Datos de \nla Empresa",
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
                        image: "assets/images/empresario.svg",
                        valor: this.nombre,
                      ),
                      SeassionCard(
                        nombre: "Direccion",
                        isDone: true,
                        image: "assets/images/ubicacion.svg",
                        valor: this.direccion,
                      ),
                      SeassionCard(
                        nombre: "Plan",
                        isDone: true,
                        image: "assets/images/tarjetacredito.svg",
                        valor: this.plan,
                      ),
                      SeassionCard(
                        nombre: "Password",
                        isDone: true,
                        image: "assets/images/candado.svg",
                        valor: '*' * this.password.length,
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

class SeassionCard extends StatelessWidget {
  final String nombre;
  final bool isDone;
  final Function press;
  final String image;
  final String valor;
  const SeassionCard({
    Key key,
    this.nombre,
    this.isDone = false,
    this.press,
    this.image,
    this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          // constraint.maxWidth provide us the available with for this widget
          //padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Colors.blue,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  //Center Row contents vertically,
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: SvgPicture.asset(image),
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: <Widget>[
                        Container(
                          width: size.width * 0.6,
                          child: Text(
                            nombre,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: size.width * 0.6,
                          child: Text(
                            "   $valor",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
