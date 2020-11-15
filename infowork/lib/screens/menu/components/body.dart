import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/contrato/components/contrato_screen.dart';
import 'package:infowork/screens/salud/components/salud.dart';
import 'package:infowork/screens/normas/components/normas_screen.dart';
import 'package:infowork/screens/perfil/components/perfil_screen.dart';
import 'package:infowork/screens/sueldo/components/sueldo_screen.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
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
                                  "assets/images/perfil3.svg",
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
                            builder: (context) => PerfilScreen(),
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
                                  "assets/images/sueldo3.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Sueldo",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SueldoScreen(),
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
                                  "assets/images/contract3.svg",
                                ),
                              ),
                            ),
                            Text(
                              "Contrato",
                              style: cardTextSyle,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContratoScreen(),
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
                                  "assets/images/salud3.svg",
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
                            builder: (context) => SaludScreen(),
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
                                  "assets/images/normas3.svg",
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
                            builder: (context) => NormaScreen(),
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
                                  "assets/images/reclamo3.svg",
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
