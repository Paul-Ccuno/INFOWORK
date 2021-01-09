import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infowork/model/empresa.dart';
import 'package:infowork/screens/menu/components/menu_screen.dart';
import 'package:infowork/screens/menuempresa/components/menuempresa.dart';

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
  final slideL;
  SlideItem(this.index, this.slideL);

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
              image: AssetImage(slideL[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideL[index].title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          slideL[index].description,
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
final slideList1 = [
  Slide(
    imageUrl: 'assets/images/perfil.png',
    title: 'Opcion Perfil',
    description: 'Ve tus datos como empresa tales como nombre, direccion, etc.',
  ),
  Slide(
    imageUrl: 'assets/images/salario.png',
    title: 'Opcion Empleados',
    description:
        'Gestiona tus empleados, teniendo en cuenta sus contratos y boletas de pago.',
  ),
  Slide(
    imageUrl: 'assets/images/salud.png',
    title: 'Opcion Salud',
    description:
        'Maneja los criterios de proteccion y salud hacia tus empleados.',
  ),
  Slide(
    imageUrl: 'assets/images/normass.png',
    title: 'Opcion Normas',
    description: 'Maneja las normas de tu empresa.',
  ),
  Slide(
    imageUrl: 'assets/images/reclamo.png',
    title: 'Opcion Reclamo',
    description: 'Con esta opcion puedes ver los reclamos de tus empleados.',
  ),
];

class GettingStartedScreen extends StatefulWidget {
  final String empresa;
  final String usuario;
  final EmpresaModel empresaModel;
  GettingStartedScreen({Key key, this.empresa, this.usuario, this.empresaModel})
      : super(key: key);
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
                      itemCount: widget.empresaModel == null
                          ? slideList.length
                          : slideList1.length,
                      itemBuilder: (ctx, i) {
                        return (widget.empresaModel == null
                            ? SlideItem(i, slideList)
                            : SlideItem(i, slideList1));
                      },
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
                              for (int i = 0;
                                  i <
                                      (widget.empresaModel == null
                                          ? slideList.length
                                          : slideList1.length);
                                  i++)
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
                            widget.empresaModel == null
                                ? Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuScreen(
                                        empresa: this.widget.empresa,
                                        usuario: this.widget.usuario,
                                      ),
                                    ),
                                  )
                                : Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuEmpresaScreen(
                                        empresaModel: widget.empresaModel,
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
