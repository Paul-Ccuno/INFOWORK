import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inforworkapp/constants.dart';
import 'package:inforworkapp/screens/empresa/empresa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INFOWORK',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EmpresaScreen(),
    );
  }
}
