import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';

class NormaEmpresaScreen extends StatelessWidget {
  final contratoProvider = new EmpresaProvider();
  final EmpresaModel empresaModel;

  NormaEmpresaScreen({Key key, this.empresaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _obtenercontrato(),
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog1(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.blue[50],
        ),
        backgroundColor: Color(0xFF3362F3),
      ),
    );
  }

  createAlertDialog1(BuildContext context) {
    TextEditingController _nombreEmpresa = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Text(
                "Crear",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            content: Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nombreEmpresa,
                    decoration: InputDecoration(
                      icon: Icon(Icons.content_paste),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ],
              ),
              height: 55,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Crear"),
                onPressed: () {
                  if (empresaModel.normas == null) {
                    empresaModel.normas = [];
                    empresaModel.normas.add(_nombreEmpresa.text.trim());
                  } else {
                    empresaModel.normas.add(_nombreEmpresa.text.trim());
                  }
                  contratoProvider.crearnormas(
                    empresaModel.normas,
                    empresaModel.nombre,
                  );
                },
              ),
            ],
          );
        });
  }

  createAlertDialog(BuildContext context, String item, int index) {
    TextEditingController _nombreEmpresa =
        new TextEditingController(text: item);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Text(
                "Actualizar",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            content: Container(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nombreEmpresa,
                    decoration: InputDecoration(
                      icon: Icon(Icons.local_hospital),
                    ),
                  ),
                ],
              ),
              height: 60,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Actualizar"),
                onPressed: () {
                  int index1 = empresaModel.normas.indexOf(item);
                  empresaModel.normas[index1] = _nombreEmpresa.text.trim();
                  print(empresaModel.normas);
                  contratoProvider.actualizarnormas(
                    index1,
                    _nombreEmpresa.text.trim(),
                    empresaModel.nombre,
                  );
                },
              ),
            ],
          );
        });
  }

  Widget _crearItem(String item, String type, BuildContext context, int index) {
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
        onTap: () {
          createAlertDialog(context, item, index);
        },
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
      future: contratoProvider.cargarEmpresa(empresaModel.nombre),
      builder: (BuildContext context, AsyncSnapshot<EmpresaModel> snapshot) {
        if (snapshot.hasData) {
          var size = MediaQuery.of(context).size;
          final declaraciones = snapshot.data.normas;
          empresaModel.normas = declaraciones;
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
                        height: size.height * .80,
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
                                itemCount: empresaModel.normas != null
                                    ? empresaModel.normas.length
                                    : 0,
                                itemBuilder: (context, i) {
                                  Key a = new Key(empresaModel.normas[i]);
                                  print("Asd" +
                                      empresaModel.normas.length.toString());
                                  return new Dismissible(
                                    key: a,
                                    onDismissed: (direction) {
                                      if (i >= empresaModel.normas.length) {
                                        empresaModel.normas.removeAt(
                                            empresaModel.normas.length - 1);
                                      } else {
                                        empresaModel.normas.removeAt(i);
                                      }
                                      contratoProvider.crearnormas(
                                        empresaModel.normas,
                                        empresaModel.nombre,
                                      );
                                      Scaffold.of(context).showSnackBar(
                                        new SnackBar(
                                          content: new Text(
                                            "elemento eliminado",
                                          ),
                                        ),
                                      );
                                    },
                                    child: _crearItem(
                                      empresaModel.normas[i],
                                      "d",
                                      context,
                                      i,
                                    ),
                                  );
                                },
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
