import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/screens/Chat/Components/chat.dart';
import 'package:infowork/screens/empresa_perfil/components/empresa_perfil.dart';
import 'package:infowork/screens/normas_empresa/components/normas_empresa.dart';
import 'package:infowork/screens/saludempresa/components/salud_empresa.dart';
import 'package:infowork/screens/trabajadores/components/trabajadores.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final EmpresaModel empresaModel;

  const Body({Key key, this.empresaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardTextSyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 14,
      color: Color.fromRGBO(63, 63, 63, 1),
    );
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment(0, -0.9),
                    child: Text(
                      "Elige una de estas opciones",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  primary: false,
                  //padding: EdgeInsets.all(12.0),
                  padding: EdgeInsetsDirectional.fromSTEB(12, 90, 12, 12),
                  children: <Widget>[
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 128,
                              height: 128,
                              child: ClipRRect(
                                child: SvgPicture.asset(
                                  "assets/images/empresa_perf.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Perfil",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmpresaPerfilScreen(
                              empresaModel: this.empresaModel,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 128,
                              height: 128,
                              child: ClipRRect(
                                child: SvgPicture.asset(
                                  "assets/images/employees.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Empleados",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrabajadoresEmpresaScreen(
                              empresaModel: this.empresaModel,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 128,
                              height: 128,
                              child: ClipRRect(
                                child: SvgPicture.asset(
                                  "assets/images/salud_menu.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Salud",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SaludEmpresaScreen(
                              empresaModel: this.empresaModel,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 128,
                              height: 128,
                              child: ClipRRect(
                                child: SvgPicture.asset(
                                  "assets/images/normas_menu.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Normas",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NormaEmpresaScreen(
                              empresaModel: this.empresaModel,
                            ),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 128,
                              height: 128,
                              child: ClipRRect(
                                child: SvgPicture.asset(
                                  "assets/images/reclamo_menu.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Reclamo",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              empresa: "#asd",
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
