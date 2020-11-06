import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/bonificacion.dart';
import 'package:infowork/model/detalle_bp.dart';
import 'package:infowork/providers/boleta_pago_provider.dart';

class SueldoScreen extends StatelessWidget {
  final contratoProvider = new BoletaProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _obtenercontrato(),
    );
  }

  Widget _crearItem(Bonificacion item, String type) {
    if (type == "d") {
      return ListTile(
        leading: CircleAvatar(
          child: Image.asset('assets/images/saludgrion.png'),
        ),
        title: Text(
          '$item',
          style: TextStyle(fontSize: 15),
        ),
        dense: true,
      );
    } else {
      return ListTile(
        leading: CircleAvatar(
          child: Image.asset('assets/images/clause.png'),
        ),
        title: Text(
          '$item',
          style: TextStyle(fontSize: 15),
        ),
        dense: true,
      );
    }
  }

  Widget _obtenercontrato() {
    return FutureBuilder(
      future: contratoProvider.cargarBoleta(),
      builder: (BuildContext context, AsyncSnapshot<BoletadePago> snapshot) {
        if (snapshot.hasData) {
          var size = MediaQuery.of(context).size;
          final boleta = snapshot.data;
          final List<Bonificacion> bonificaciones = boleta.detalle.bonificacion;
          final List<Bonificacion> descuentos = boleta.detalle.descuento;

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
                        "Boleta de Pago\ndel Empleado",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              width: 400,
                              child: Text(
                                "Boleta " + boleta.id.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              width: size.width,
                              child: Text(
                                "Fecha : " + boleta.fecha.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              padding: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                            ),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.42,
                                      child: Text(
                                        "Bonificaciones",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding:
                                          new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    ),
                                    Container(
                                      width: size.width * 0.42,
                                      child: Text(
                                        "Descuentos",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      padding:
                                          new EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    children: List.generate(
                                      bonificaciones.length,
                                      (index) {
                                        return SeassionCard(
                                          nombre: bonificaciones[index]
                                              .nombre
                                              .toString(),
                                          isDone: true,
                                          image:
                                              "assets/images/positive-vote.svg",
                                          valor: bonificaciones[index]
                                              .cantidad
                                              .toString(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: List.generate(
                                      descuentos.length,
                                      (index) {
                                        return SeassionCard(
                                          nombre: descuentos[index]
                                              .nombre
                                              .toString(),
                                          /*bonificaciones[index]
                                              .nombre
                                              .toString(),""*/
                                          isDone: true,
                                          image: "assets/images/bad-review.svg",
                                          valor: descuentos[index]
                                              .cantidad
                                              .toString(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: size.width,
                        child: Text(
                          "Monto : " + boleta.detalle.monto.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        padding: new EdgeInsets.fromLTRB(10, 20, 10, 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -12,
                color: Colors.blue,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
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
                    SizedBox(width: 0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nombre,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          valor,
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
