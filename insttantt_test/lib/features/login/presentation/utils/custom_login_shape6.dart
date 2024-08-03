import 'package:flutter/material.dart';

class CustomLoginShapeClipper6 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.675);

    var firstEndpoint = Offset(size.width * 0.78, size.height * 0.8);
    var firstControlPoint = Offset(size.width * 0.875, size.height * 0.70);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    var secondEndpoint = Offset(size.width * 0.30, size.height * 0.9275);
    var secondControlPoint = Offset(size.width * 0.70, size.height * 0.8975);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    var thirdEndpoint = Offset(size.width * 0.0, size.height);
    var thirdControlPoint = Offset(size.width * 0.04, size.height * 0.95);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
