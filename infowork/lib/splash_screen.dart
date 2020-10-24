import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infowork/screens/login/components/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 5000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Spacer(),
              Center(
                child: FractionallySizedBox(
                  widthFactor: .8,
                  child: SvgPicture.asset(
                    "assets/images/splash_log.svg",
                    width: 400,
                  ),
                ),
              ),
              Spacer(),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              Spacer(),
              Text(
                "Bienvenido",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Colors.lightBlue[800],
              Colors.blue[600],
              Colors.blue[700],
              Colors.blue[800]
            ],
          ),
        ),
      ),
    );
  }
}
