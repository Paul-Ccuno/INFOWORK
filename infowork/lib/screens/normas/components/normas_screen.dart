import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';

class NormaScreen extends StatelessWidget {
  final contratoProvider = new EmpresaProvider();
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
          child: Image.asset('assets/images/normasempresa.png'),
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
      future: contratoProvider.cargarEmpresa(),
      builder: (BuildContext context, AsyncSnapshot<EmpresaModel> snapshot) {
        if (snapshot.hasData) {
          var size = MediaQuery.of(context).size;
          final declaraciones = snapshot.data.normas;
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
                        "Normas de la\nEmpresa",
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
                                "Normas",
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
