import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';

import '../../../constans.dart';
import 'body.dart';

class EmpresaPerfilScreen extends StatefulWidget {
  final EmpresaModel empresaModel;

  EmpresaPerfilScreen({Key key, this.empresaModel}) : super(key: key);

  @override
  _EmpresaPerfilScreenState createState() => _EmpresaPerfilScreenState();
}

class _EmpresaPerfilScreenState extends State<EmpresaPerfilScreen> {
  final empresaprovider = new EmpresaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: _datosempresa(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context, widget.empresaModel)
              .then((_) => setState(() {}));
        },
        child: Icon(
          Icons.edit,
          color: Colors.blue[50],
        ),
        backgroundColor: Color(0xFF3362F3),
      ),
    );
  }

  createAlertDialog(BuildContext context, EmpresaModel empresaModel) {
    TextEditingController _nombreEmpresa =
        new TextEditingController(text: empresaModel.nombre);
    TextEditingController _ubicacionController =
        new TextEditingController(text: empresaModel.direccion);
    TextEditingController _passwordController =
        new TextEditingController(text: empresaModel.password);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Container(
              child: Text(
                "Actualizacion de perfil",
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
                      icon: Icon(Icons.business),
                      labelText: "Nombre de la empresa",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  TextFormField(
                    controller: _ubicacionController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.map),
                      labelText: "Direccion de la empresa",
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password de la empresa",
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ],
              ),
              height: 200,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Actualizar"),
                onPressed: () {
                  var nombre = _nombreEmpresa.text.trim();
                  if (empresaModel.nombre == nombre) {
                    //print(empresaModel.normas);
                    empresaModel.password = _passwordController.text.trim();
                    empresaModel.direccion = _ubicacionController.text.trim();
                    empresaprovider.actualizarEmpresa(empresaModel);
                    //empresaprovider.actualizarEmpresa(empresaModel);
                  } else {
                    empresaprovider.cargarEmpresa(nombre).then(
                      (value) {
                        if (value == null) {
                          empresaprovider.eliminarEmpresa(empresaModel.nombre);
                          empresaModel.nombre = nombre;
                          empresaprovider.actualizarEmpresa(empresaModel);
                          return (value);
                        } else {
                          print("asd");
                        }
                      },
                    );
                  }
                },
              ),
            ],
          );
        });
  }

  Widget _datosempresa() {
    return FutureBuilder(
      future: empresaprovider.cargarEmpresa(widget.empresaModel.nombre),
      builder: (BuildContext context, AsyncSnapshot<EmpresaModel> snapshot) {
        if (snapshot.hasData) {
          return Body(
            nombre: snapshot.data.nombre,
            direccion: snapshot.data.direccion,
            plan: snapshot.data.plan,
            password: snapshot.data.password,
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
          width: constraint
              .maxWidth, // constraint.maxWidth provide us the available with for this widget
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
                      width: 50,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: SvgPicture.asset(image),
                    ),
                    SizedBox(width: 20),
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
