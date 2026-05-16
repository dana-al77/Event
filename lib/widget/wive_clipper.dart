
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height/2); // بداية الخط في الزاوية السفلية اليسرى

    path.cubicTo(size.width /4,3 * (size.height /2), 3 * (size.width /2), size.height /2 ,
        size.width,size.height * 0.9
    );
    path.lineTo(size.width, 0); // نهاية الخط في الزاوية العلوية اليمنى

    return path;
  }

  @override
  bool shouldReclip(covariant  CustomClipper<Path> oldClipper) {
    return true;
  }
}