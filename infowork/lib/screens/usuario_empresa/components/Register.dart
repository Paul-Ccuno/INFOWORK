import 'package:flutter/material.dart';
import 'package:infowork/screens/usuario_empresa/components/curvedwidget.dart';

import '../../../constans.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20),
                  width: double.infinity,
                  height: 300,
                  decoration: boxdecoration,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: new EdgeInsets.fromLTRB(20, 280, 20, 10),
                child: Column(
                  children: <Widget>[
                    LoginForm(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            labelText: "Nombre de la empresa",
          ),
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.always,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "Correo Institucional",
          ),
          obscureText: true,
          autovalidateMode: AutovalidateMode.always,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "Password",
          ),
          obscureText: true,
          autovalidateMode: AutovalidateMode.always,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              colors: [Color(0xFF3362F3), Color(0XFF3967F2), Color(0xFF5079F3)],
            ),
          ),
          width: 130,
        ),
      ],
    );
  }
}
