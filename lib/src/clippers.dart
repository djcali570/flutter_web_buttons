import 'package:flutter/material.dart';


class PillClipper extends CustomClipper<Path> {
  final double chosenRadius;
  PillClipper(this.chosenRadius);

  @override
  Path getClip(Size size) {
    var path = Path();
    var radius = chosenRadius;

    /// Start half way down.
    path.lineTo(0.0, size.height / 2);

    /// Left Bottom Corner
    path.quadraticBezierTo(
      Offset(0.0, size.height).dx,
      Offset(0.0, size.height).dy,
      Offset(radius, size.height).dx,
      Offset(radius, size.height).dy,
    );

    /// Line on bottom
    path.lineTo(size.width - radius, size.height);

    /// Right Bottom Corner
    path.quadraticBezierTo(
      Offset(size.width, size.height).dx,
      Offset(size.width, size.height).dy,
      Offset(size.width, size.height / 2).dx,
      Offset(size.width, size.height / 2).dy,
    );

    /// Right Top Corner
    path.quadraticBezierTo(
      Offset(size.width, 0.0).dx,
      Offset(size.width, 0.0).dy,
      Offset(size.width - radius, 0.0).dx,
      Offset(size.width - radius, 0.0).dy,
    );

    // Line back to top left.
    path.lineTo(radius, 0);

    /// Left Top Corner
    path.quadraticBezierTo(
      const Offset(0.0, 0.0).dx,
      const Offset(0.0, 0.0).dy,
      Offset(0.0, size.height / 2).dx,
      Offset(0.0, size.height / 2).dy,
    );

    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
