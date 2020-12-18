import 'package:flutter/material.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/providers/empresa_provider.dart';

class ChatScreen extends StatelessWidget {
  final contratoProvider = new EmpresaProvider();
  final String empresa;

  ChatScreen({Key key, this.empresa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("asd"),
    );
  }



}
