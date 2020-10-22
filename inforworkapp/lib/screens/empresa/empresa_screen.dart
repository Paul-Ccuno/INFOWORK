import 'package:flutter/material.dart';
import 'package:inforworkapp/constants.dart';

import 'components/body.dart';

class EmpresaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Inforwork"),
      centerTitle: false,
    );
  }
}
