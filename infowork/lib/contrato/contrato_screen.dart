import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/contrato.dart';
import 'package:infowork/providers/contrato_provider.dart';

class ContratoScreen extends StatelessWidget {
  final contratoProvider = new ContratoProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _obtenercontrato(),
    );
  }

  Widget _crearItem(String item, String type) {
    if (type == "d") {
      return ListTile(
        leading: CircleAvatar(
          child: Image.asset('assets/images/declaration.png'),
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
      future: contratoProvider.cargarContrato(),
      builder: (BuildContext context, AsyncSnapshot<ContratoModel> snapshot) {
        if (snapshot.hasData) {
          var size = MediaQuery.of(context).size;
          final declaraciones = snapshot.data.declaraciones;
          final clausulas = snapshot.data.clausulas;
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
                        "Contrato del\nEmpleado",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        height: 680,
                        padding: new EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              width: 400,
                              child: Text(
                                "Clausulas",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: clausulas.length,
                                itemBuilder: (context, i) =>
                                    _crearItem(clausulas[i], "c"),
                              ),
                            ),
                            Container(
                              width: 400,
                              child: Text(
                                "Declaraciones",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: declaraciones.length,
                                itemBuilder: (context, i) =>
                                    _crearItem(declaraciones[i], "d"),
                              ),
                            ),
                          ],
                        ),
                      )
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
