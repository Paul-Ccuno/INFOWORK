import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/screens/Chat/Components/chat.dart';
import 'package:infowork/screens/empresa_perfil/components/empresa_perfil.dart';
import 'package:infowork/screens/normas_empresa/components/normas_empresa.dart';
import 'package:infowork/screens/saludempresa/components/salud_empresa.dart';
import 'package:infowork/screens/trabajadores/components/trabajadores.dart';
import 'package:infowork/services/payment.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stripe_payment/stripe_payment.dart';

import '../../../constans.dart';

class Body extends StatefulWidget {
  EmpresaModel empresaModel;
  final databaseReference = FirebaseDatabase.instance.reference();

  Body({Key key, this.empresaModel}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  payViaNewCard(BuildContext context, empresa, databaseReference) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please wait...');
    await dialog.show();
    var response =
        await StripeService.payWithNewCard(amount: '15000', currency: 'USD');
    await dialog.hide();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(response.message),
      duration:
          new Duration(milliseconds: response.success == true ? 1200 : 3000),
    ));
    if (response.success == true) {
      databaseReference
          .child("Empresa")
          .child(empresa.nombre)
          .child("plan")
          .set("premium");
    }
    empresa.plan = "premium";
    return empresa;
  }

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
                              empresaModel: this.widget.empresaModel,
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
                              empresaModel: this.widget.empresaModel,
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
                              empresaModel: this.widget.empresaModel,
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
                              empresaModel: this.widget.empresaModel,
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
                        onTap: () {
                          widget.empresaModel.plan == "gratis"
                              ? realizarpago()
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                      empresa: this.widget.empresaModel,
                                    ),
                                  ),
                                );
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  realizarpago() async {
    {
      widget.empresaModel = await payViaNewCard(
          context, widget.empresaModel, widget.databaseReference);
      if (widget.empresaModel.plan == "premium") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              empresa: this.widget.empresaModel,
            ),
          ),
        );
      }
    }
  }
}
