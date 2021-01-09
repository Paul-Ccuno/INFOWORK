import 'package:flutter/material.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/screens/help/components/help.dart';

import '../../../constans.dart';
import 'body.dart';
import 'maindrawempresa.dart';

class MenuEmpresaScreen extends StatelessWidget {
  final EmpresaModel empresaModel;

  const MenuEmpresaScreen({Key key, this.empresaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      drawer: MainDrawEmpresa(empresaModel: empresaModel),
      body: Body(empresaModel: empresaModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GettingStartedScreen(
                empresa: "",
                usuario: "",
                empresaModel: empresaModel,
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
