import 'package:flutter/material.dart';

class CustomLoginShapeClipper5 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height * 0.3);

    var firstEndpoint = Offset(size.width * 0.17, size.height * 0.2);
    var firstControlPoint = Offset(size.width * 0.075, size.height * 0.30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    var secondEndpoint = Offset(size.width * 0.6, size.height * 0.05);
    var secondControlPoint = Offset(size.width * 0.3, size.height * 0.06);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    var thirdEndpoint = Offset(size.width * 0.95, size.height * 0.0);
    var thirdControlPoint = Offset(size.width * 0.9, size.height * 0.05);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndpoint.dx, thirdEndpoint.dy);

//    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
