import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/screens/chatroom/components/body.dart';
import 'package:intl/intl.dart';

import '../../../constans.dart';

class ChatRoomScreen extends StatelessWidget {
  final EmpresaModel empresaModel;
  final TrabajadorModel trabajadorModel;
  final databaseReference = FirebaseDatabase.instance.reference();

  ChatRoomScreen({Key key, this.empresaModel, this.trabajadorModel})
      : super(key: key);
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
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
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
            print(snapshot.hasData.toString());
            List<MensajeModel> mensajes = new List();
            if (snapshot.data.snapshot.value != null) {
              snapshot.data.snapshot.value.forEach(
                (data) {
                  mensajes.add(new MensajeModel(
                      autor: data["autor"],
                      mensaje: data["mensaje"],
                      fecha: data["tiempo"],
                      estado: data["status"]));
                },
              );
            }
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
                          final MensajeModel mensajeuser = mensajes[index];
                          return chatitem(mensajeuser, context);
                        },
                      )
                    ],
                  ),
                ),
                enviarmensajes(mensajes.length),
              ],
            );
          } else {
            return Text("Asd");
          }
        },
      ),
    );
  }

  Widget enviarmensajes(int cantidad) {
    final myController = TextEditingController();
    DateTime hoy = DateTime.now();
    print(DateFormat('EEEE').format(hoy));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: "Envia un mensaje",
            ),
            controller: myController,
          )),
          IconButton(
              icon: Icon(
                Icons.send,
                color: kPrimaryColor,
              ),
              onPressed: () {
                databaseReference
                    .child("Empresa")
                    .child(empresaModel.nombre)
                    .child("Trabajador")
                    .child(trabajadorModel.dni)
                    .child("mensajes")
                    .child(cantidad.toString())
                    .set({
                  "autor": empresaModel.nombre,
                  "mensaje": myController.text,
                  "status": false,
                  "tiempo": DateFormat('EEEE').format(hoy) +
                      " " +
                      DateFormat.jm().format(hoy)
                });
                print("asd");
              })
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Chat"),
      centerTitle: true,
      toolbarHeight: 60,
    );
  }
}
