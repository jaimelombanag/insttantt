import 'package:flutter/material.dart';

class CustomLoginShapeClipper3 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.05, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.7);

    var firstEndpoint = Offset(size.width * 0.83, size.height * 0.8);
    var firstControlPoint = Offset(size.width * 0.925, size.height * 0.70);
//
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);
//
    var secondEndpoint = Offset(size.width * 0.30, size.height * 0.95);
    var secondControlPoint =
        Offset(size.width * 0.70, size.height * 0.92); //height
//
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);
//
    var thirdEndpoint = Offset(size.width * 0.05, size.height);
    var thirdControlPoint =
        Offset(size.width * 0.1, size.height * 0.95); //width

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);
//
//
//    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
