import 'package:flutter/material.dart';

class CurvedWidget extends StatelessWidget {
  final double curvedDistance;
  final double curvedHeight;
  final Widget child;

  const CurvedWidget(
      {Key key, this.curvedDistance = 80, this.curvedHeight = 80, this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurverdWidgetBackgroundClipper(
        curvedDistance: curvedDistance,
        curvedHeight: curvedHeight,
      ),
      child: child,
    );
  }
}

class CurverdWidgetBackgroundClipper extends CustomClipper<Path> {
  final double curvedDistance;
  final double curvedHeight;
  CurverdWidgetBackgroundClipper({this.curvedDistance, this.curvedHeight});
  @override
  getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.lineTo(size.width, 0);
    clippedPath.lineTo(size.width, size.height - curvedDistance - curvedHeight);
    clippedPath.quadraticBezierTo(
      size.width,
      size.height - curvedHeight,
      size.width - curvedDistance,
      size.height - curvedHeight,
    );
    clippedPath.lineTo(curvedDistance, size.height - curvedHeight);
    clippedPath.quadraticBezierTo(
        0, size.height - curvedHeight, 0, size.height);
    clippedPath.lineTo(0, 0);
    return clippedPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
