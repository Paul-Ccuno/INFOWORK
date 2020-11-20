import 'package:flutter/material.dart';
import 'package:infowork/screens/help/components/help.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GettingStartedScreen(),
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
