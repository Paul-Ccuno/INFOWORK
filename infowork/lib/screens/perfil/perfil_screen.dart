import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/providers/tabajador_provider.dart';

import '../../constans.dart';

class PerfilScreen extends StatelessWidget {
  final trabajadorProvider = new TrabajadorProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _datosempleado(),
    );
  }

  Widget _datosempleado() {
    return FutureBuilder(
      future: trabajadorProvider.cargarTrabajador(),
      builder: (BuildContext context, AsyncSnapshot<TrabajadorModel> snapshot) {
        if (snapshot.hasData) {
          return Body(
            nombre: snapshot.data.nombre,
            apellido: snapshot.data.apellido,
            edad: snapshot.data.edad,
            sueldo: snapshot.data.sueldo,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

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
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint
              .maxWidth, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 50,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: SvgPicture.asset(image),
                    ),
                    SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nombre,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("                   $valor")
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
