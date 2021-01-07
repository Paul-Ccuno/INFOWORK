import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/screens/contrato/components/contrato_screen.dart';
import 'package:infowork/screens/salud/components/salud.dart';
import 'package:infowork/screens/normas/components/normas_screen.dart';
import 'package:infowork/screens/perfil/components/perfil_screen.dart';
import 'package:infowork/screens/sueldo/components/sueldo_screen.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  final EmpresaModel empresaModel;
  final TrabajadorModel trabajadorModel;
  final databaseReference = FirebaseDatabase.instance.reference();

  Body({Key key, this.empresaModel, this.trabajadorModel}) : super(key: key);

  Widget chatitem(MensajeModel message, context) {
    if (message.autor == empresaModel.nombre) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              child: Text(
                message.mensaje,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5),
                  ]),
              padding: EdgeInsets.all(10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                message.fecha,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/empresa.png'),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              child: Text(
                message.mensaje,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5),
                  ]),
              padding: EdgeInsets.all(10),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/trabajador.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                message.fecha,
                style: TextStyle(fontSize: 10, color: Colors.black54),
              )
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference
            .child("Empresa")
            .child(empresaModel.nombre)
            .child("Trabajador")
            .child(trabajadorModel.dni)
            .child("mensajes")
            .onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MensajeModel> mensajes = new List();
            snapshot.data.snapshot.value.forEach(
              (data) {
                mensajes.add(new MensajeModel(
                    autor: data["autor"],
                    mensaje: data["mensaje"],
                    fecha: data["tiempo"],
                    estado: data["status"]));
              },
            );
            return Column(
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
                      ListView.builder(
                        itemCount: mensajes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final MensajeModel mensajeuser =
                              mensajes[index];
                          return chatitem(mensajeuser, context);
                        },
                      )
                    ],
                  ),
                ),
                Text("Envia tu mensaje"),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    /*
    Column(
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
    ListView.builder(
    itemCount: trabajadorModel.mensajes.length,
    itemBuilder: (BuildContext context, int index) {
    final MensajeModel mensajeuser =
    trabajadorModel.mensajes[index];
    return chatitem(mensajeuser, context);
    },
    )
    ],
    ),
    ),
    Text("Envia tu mensaje"),
    ],
    ),
    );
    }
      }*/
  }
}
