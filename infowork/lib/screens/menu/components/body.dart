import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/screens/Chat/Components/chat.dart';
import 'package:infowork/screens/chatroom/components/chatroom.dart';
import 'package:infowork/screens/contrato/components/contrato_screen.dart';
import 'package:infowork/screens/salud/components/salud.dart';
import 'package:infowork/screens/normas/components/normas_screen.dart';
import 'package:infowork/screens/perfil/components/perfil_screen.dart';
import 'package:infowork/screens/sueldo/components/sueldo_screen.dart';
import 'package:intl/intl.dart';

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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatRoomUserScreen(
                              empresaModel: this.empresa,
                              usuario: this.usuario
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

class ChatRoomUserScreen extends StatelessWidget {
  final String empresaModel;
  final String usuario;
  final databaseReference = FirebaseDatabase.instance.reference();

  ChatRoomUserScreen({Key key, this.empresaModel, this.usuario})
      : super(key: key);
  Widget chatitem(MensajeModel message, context) {
    if (message.autor == usuario) {
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
                  backgroundImage: AssetImage('assets/images/trabajador.png'),
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
                  backgroundImage: AssetImage('assets/images/empresa.png'),
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
            .child(empresaModel)
            .child("Trabajador")
            .child(usuario)
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
                  .child(empresaModel)
                  .child("Trabajador")
                  .child(usuario)
                  .child("mensajes")
                  .child(cantidad.toString())
                  .set({
                "autor": usuario,
                "mensaje": myController.text,
                "status": false,
                "tiempo": DateFormat('EEEE').format(hoy) +
                    " " +
                    DateFormat.jm().format(hoy)
              });
            },
          )
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
