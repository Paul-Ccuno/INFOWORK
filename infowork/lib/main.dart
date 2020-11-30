import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infowork/constans.dart';
import 'package:infowork/screens/usuario_empresa/components/usuario_empresa.dart';
import 'package:infowork/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryColor,
        cursorColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        "/usuarioempresa": (_) => new UsuarioEmpresa(),
      },
    );
  }
}
