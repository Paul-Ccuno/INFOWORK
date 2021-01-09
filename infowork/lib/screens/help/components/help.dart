import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infowork/screens/menu/components/menu_screen.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/perfil.png',
    title: 'Opcion Perfil',
    description:
        'Ve tus datos como trabajador tales como nombre, apellido, edad y sueldo.',
  ),
  Slide(
    imageUrl: 'assets/images/salario.png',
    title: 'Opcion Sueldo',
    description:
        'Informate de tu boleta de pago, teniendo en cuenta tus bonificaciones, descuento y el monto total.',
  ),
  Slide(
    imageUrl: 'assets/images/contrato.png',
    title: 'Opcion Contrato',
    description:
        'Informate sobre las clausulas y declaraciones en tu contrato.',
  ),
  Slide(
    imageUrl: 'assets/images/salud.png',
    title: 'Opcion Salud',
    description:
        'Informate de la seguridad y salud que te brinda la empresa para protegerte del riesgo de tu trabajo.',
  ),
  Slide(
    imageUrl: 'assets/images/normass.png',
    title: 'Opcion Normas',
    description:
        'Informate de las normas que tienes que seguir dentro de tu empresa.',
  ),
  Slide(
    imageUrl: 'assets/images/reclamo.png',
    title: 'Opcion Reclamo',
    description:
        'En caso de no estar de acuerdo con un descuento o que falte una bonificacion usar esta opcion para hacer llegar tus reclamos a tu empresa.',
  ),
];

class GettingStartedScreen extends StatefulWidget {
  final String empresa;
  final String usuario;

  GettingStartedScreen({Key key, this.empresa, this.usuario}) : super(key: key);
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: MaterialButton(
                          onPressed: () {
                            print(this.widget.empresa);
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuScreen(
                                  empresa: this.widget.empresa,
                                  usuario: this.widget.usuario,
                                ),
                              ),
                            );
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: StadiumBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Volver  a menu',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.keyboard_return,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF3362F3),
                              Color(0XFF3967F2),
                              Color(0xFF5079F3)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
