import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/model/trabajador.dart';
import 'package:infowork/providers/empresa_provider.dart';
import 'package:infowork/screens/chatroom/components/chatroom.dart';

import '../../../constans.dart';

List<MensajeModel> demensajes(mensajes) {
  List<MensajeModel> mensa = new List<MensajeModel>();
  mensajes.forEach((data) {
    mensa.add(new MensajeModel(
        autor: data["autor"],
        mensaje: data["mensaje"],
        fecha: data["tiempo"],
        estado: data["status"]));
  });
  return mensa;
}

class ChatScreen extends StatelessWidget {
  final EmpresaModel empresa;
  final EmpresaProvider trabajador = new EmpresaProvider();
  final databaseReference = FirebaseDatabase.instance.reference();

  ChatScreen({
    Key key,
    this.empresa,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return empresa.plan != "gratis"
        ? Scaffold(
            body: StreamBuilder(
              stream: databaseReference
                  .child("Empresa")
                  .child(empresa.nombre)
                  .child("Trabajador")
                  .onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TrabajadorModel> trabajadores = new List();
                  snapshot.data.snapshot.value.forEach(
                    (index, data) {
                      trabajadores.add(
                        TrabajadorModel(
                            dni: index,
                            nombre: data["nombre"],
                            apellido: data["Apellido"],
                            mensajes: data["mensajes"] != null
                                ? demensajes(data["mensajes"])
                                : null),
                      );
                    },
                  );
                  return Scaffold(
                    backgroundColor: kPrimaryColor,
                    appBar: buildAppBar(),
                    body: SafeArea(
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
                                ListView.builder(
                                  itemCount: trabajadores.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final TrabajadorModel chat =
                                        trabajadores[index];
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => ChatRoomScreen(
                                              empresaModel: empresa,
                                              trabajadorModel: chat),
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40)),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                  )
                                                ],
                                              ),
                                              child: CircleAvatar(
                                                radius: 35,
                                                backgroundImage: AssetImage(
                                                    'assets/images/trabajador.png'),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        chat.nombre +
                                                            " " +
                                                            chat.apellido,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      chat.mensajes != null &&
                                                              chat
                                                                      .mensajes[
                                                                          chat.mensajes.length -
                                                                              1]
                                                                      .autor !=
                                                                  empresa
                                                                      .nombre &&
                                                              chat
                                                                      .mensajes[
                                                                          chat.mensajes.length -
                                                                              1]
                                                                      .estado !=
                                                                  true
                                                          ? Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                              width: 7,
                                                              height: 7,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            )
                                                          : Container(
                                                              child: null,
                                                            ),
                                                      Text(
                                                        chat.mensajes != null
                                                            ? chat
                                                                .mensajes[chat
                                                                        .mensajes
                                                                        .length -
                                                                    1]
                                                                .fecha
                                                            : "00:00",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      chat.mensajes != null
                                                          ? chat
                                                              .mensajes[chat
                                                                      .mensajes
                                                                      .length -
                                                                  1]
                                                              .mensaje
                                                          : "Envia un mensaje",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black54,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        : ModuloPago();
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Reclamos"),
      centerTitle: true,
      toolbarHeight: 60,
    );
  }
}

class ModuloPago extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("asd"),
      ),
    );
  }
}
