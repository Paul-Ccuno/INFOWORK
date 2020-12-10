import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/providers/tabajador_provider.dart';

class TrabajadoresEmpresaScreen extends StatelessWidget {
  final contratoProvider = new EmpresaProvider();
  final EmpresaModel empresaModel;
  final TrabajadorProviderPrueba trabajadorProvider =
      new TrabajadorProviderPrueba();
  TrabajadoresEmpresaScreen({Key key, this.empresaModel}) : super(key: key);

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
    TextEditingController _dniTrabajador = new TextEditingController();
    TextEditingController _nombreTrabajador = new TextEditingController();
    TextEditingController _apellidoTrabajador = new TextEditingController();
    TextEditingController _passwordTrabajador = new TextEditingController();
    TextEditingController _edadTrabajador = new TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            child: Text(
              "Crear Trabajador",
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
                  controller: _dniTrabajador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                TextFormField(
                  controller: _nombreTrabajador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                TextFormField(
                  controller: _apellidoTrabajador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                TextFormField(
                  controller: _passwordTrabajador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
                TextFormField(
                  controller: _edadTrabajador,
                  decoration: InputDecoration(
                    icon: Icon(Icons.date_range),
                  ),
                  autovalidateMode: AutovalidateMode.always,
                ),
              ],
            ),
            height: 250,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Crear"),
              onPressed: () {
                if (empresaModel.trabajador == null) {
                  empresaModel.trabajador = [];
                  print(empresaModel.trabajador);
                  trabajadorProvider
                      .cargarTrabajador(
                    empresaModel.nombre,
                    _dniTrabajador.text.trim(),
                  )
                      .then(
                    (value) {
                      if (value == null) {
                        empresaModel.trabajador.add(
                          new TrabajadorModel(
                            dni: _dniTrabajador.text.trim(),
                            nombre: _nombreTrabajador.text.trim(),
                            apellido: _apellidoTrabajador.text.trim(),
                            password: _passwordTrabajador.text.trim(),
                            edad: int.parse(_edadTrabajador.text.trim()),
                          ),
                        );
                        contratoProvider.crearTrabajador(
                          empresaModel.nombre,
                          empresaModel
                              .trabajador[empresaModel.trabajador.length - 1],
                        );
                      } else {
                        print("ya existe pe");
                      }
                    },
                  );
                } else {
                  print(empresaModel.trabajador);
                  trabajadorProvider
                      .cargarTrabajador(
                    empresaModel.nombre,
                    _dniTrabajador.text.trim(),
                  )
                      .then(
                    (value) {
                      if (value == null) {
                        empresaModel.trabajador.add(
                          new TrabajadorModel(
                            dni: _dniTrabajador.text.trim(),
                            nombre: _nombreTrabajador.text.trim(),
                            apellido: _apellidoTrabajador.text.trim(),
                            password: _passwordTrabajador.text.trim(),
                            edad: int.parse(_edadTrabajador.text.trim()),
                          ),
                        );
                        contratoProvider.crearTrabajador(
                          empresaModel.nombre,
                          empresaModel
                              .trabajador[empresaModel.trabajador.length - 1],
                        );
                      } else {
                        print("ya existe pe");
                      }
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  createAlertDialog(BuildContext context, TrabajadorModel item, int index) {
    TextEditingController _dniTrabajador =
        new TextEditingController(text: item.dni);
    TextEditingController _nombreTrabajador =
        new TextEditingController(text: item.nombre);
    TextEditingController _apellidoTrabajador =
        new TextEditingController(text: item.apellido);
    TextEditingController _passwordTrabajador =
        new TextEditingController(text: item.password);
    TextEditingController _edadTrabajador =
        new TextEditingController(text: item.edad.toString());
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
                    controller: _dniTrabajador,
                    decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  TextFormField(
                    controller: _nombreTrabajador,
                    decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  TextFormField(
                    controller: _apellidoTrabajador,
                    decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  TextFormField(
                    controller: _passwordTrabajador,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  TextFormField(
                    controller: _edadTrabajador,
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range),
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ],
              ),
              height: 250,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Actualizar"),
                onPressed: () {
                  if (_dniTrabajador != item.dni) {
                    contratoProvider.eliminartrabajador(
                        empresaModel.nombre, item);
                    item.dni = _dniTrabajador.text.trim();
                    item.nombre = _nombreTrabajador.text.trim();
                    item.apellido = _apellidoTrabajador.text.trim();
                    item.password = _passwordTrabajador.text.trim();
                    item.edad = int.parse(_edadTrabajador.text.trim());
                    contratoProvider.crearTrabajador(empresaModel.nombre, item);
                  } else {
                    contratoProvider.crearTrabajador(empresaModel.nombre, item);
                  }
                },
              ),
            ],
          );
        });
  }

  Widget _crearItem(
      TrabajadorModel item, String type, BuildContext context, int index) {
    if (type == "d") {
      return ListTile(
        leading: CircleAvatar(
          child: Image.asset('assets/images/empleado.png'),
        ),
        title: Text(
          item.dni,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Text(
          item.nombre + " " + item.apellido,
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
          final declaraciones = snapshot.data.trabajador;
          empresaModel.trabajador = declaraciones;
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
                        "Trabajadores de\nla Empresa",
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
                                "Trabajadores",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: empresaModel.trabajador != null
                                    ? empresaModel.trabajador.length
                                    : 0,
                                itemBuilder: (context, i) {
                                  Key a = new UniqueKey();
                                  return new Dismissible(
                                    key: a,
                                    onDismissed: (direction) {
                                      if (i >= empresaModel.trabajador.length) {
                                        contratoProvider.eliminartrabajador(
                                          empresaModel.nombre,
                                          empresaModel.trabajador[i - 1],
                                        );
                                        empresaModel.trabajador.removeAt(
                                          empresaModel.trabajador.length - 1,
                                        );
                                      } else {
                                        contratoProvider.eliminartrabajador(
                                          empresaModel.nombre,
                                          empresaModel.trabajador[i],
                                        );
                                        empresaModel.trabajador.removeAt(i);
                                      }
                                      Scaffold.of(context).showSnackBar(
                                        new SnackBar(
                                          content: new Text(
                                            "elemento eliminado",
                                          ),
                                        ),
                                      );
                                    },
                                    child: _crearItem(
                                      empresaModel.trabajador[i],
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
