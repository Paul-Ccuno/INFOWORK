import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constans.dart';

class SeassionCard extends StatelessWidget {
  final String nombre;
  final bool isDone;
  final Function press;
  final String image;
  final String valor;
  const SeassionCard({
    Key key,
    this.nombre,
    this.isDone = false,
    this.press,
    this.image,
    this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint
              .maxWidth, // constraint.maxWidth provide us the available with for this widget
          //padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Colors.blue,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  //Center Row contents vertically,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 50,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: SvgPicture.asset(image),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          nombre,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("                   $valor")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
