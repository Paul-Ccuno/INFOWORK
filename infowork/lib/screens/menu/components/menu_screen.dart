import 'package:flutter/material.dart';
import 'package:infowork/screens/help/components/help.dart';
import 'package:infowork/screens/menu/components/body.dart';
import 'package:infowork/screens/menu/components/maindraw.dart';

import '../../../constans.dart';

class MenuScreen extends StatelessWidget {
  final String empresa;
  final String usuario;

  const MenuScreen({Key key, this.empresa, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      drawer: MainDraw(
        empresa: this.empresa,
        usuario: this.usuario,
      ),
      body: Body(
        empresa: this.empresa,
        usuario: this.usuario,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GettingStartedScreen(
                empresa: this.empresa,
                usuario: this.usuario,
              ),
            ),
          );
        },
        child: Icon(
          Icons.help_sharp,
          color: Colors.blue[50],
        ),
        backgroundColor: Color(0xFF3362F3),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Home"),
      centerTitle: false,
      toolbarHeight: 60,
    );
  }
}
