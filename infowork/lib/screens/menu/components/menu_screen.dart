import 'package:flutter/material.dart';
import 'package:infowork/screens/menu/components/body.dart';
import 'package:infowork/screens/menu/components/maindraw.dart';

import '../../../constans.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      drawer: MainDraw(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Home"),
      centerTitle: false,
    );
  }
}
