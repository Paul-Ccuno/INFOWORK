import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/Chat/Components/chat.dart';
import 'package:infowork/screens/contrato/components/contrato_screen.dart';
import 'package:infowork/screens/salud/components/salud.dart';
import 'package:infowork/screens/normas/components/normas_screen.dart';
import 'package:infowork/screens/perfil/components/perfil_screen.dart';
import 'package:infowork/screens/sueldo/components/sueldo_screen.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final String empresa;
  final String usuario;

  const Body({Key key, this.empresa, this.usuario}) : super(key: key);

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
                                  "assets/images/perfil_menu.svg",
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
                            builder: (context) => PerfilScreen(
                              empresa: this.empresa,
                              usuario: this.usuario,
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
                                  "assets/images/salario_menu.svg",
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
                            builder: (context) => SueldoScreen(
                              empresa: this.empresa,
                              usuario: this.usuario,
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
                                  "assets/images/contrato_menu.svg",
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
                            builder: (context) => ContratoScreen(
                              empresa: this.empresa,
                              usuario: this.usuario,
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
                            builder: (context) => SaludScreen(
                              empresa: this.empresa,
                              usuario: this.usuario,
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
                            builder: (context) => NormaScreen(
                              empresa: this.empresa,
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
