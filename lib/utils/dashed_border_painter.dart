import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0;
    double dashSpace = 3.0;
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    var dashPath = _createDashedPath(path, dashWidth, dashSpace);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path originalPath, double dashWidth, double dashSpace) {
    Path dashedPath = Path();
    for (PathMetric pathMetric in originalPath.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < pathMetric.length) {
        double length = draw ? dashWidth : dashSpace;
        if (distance + length > pathMetric.length) {
          length = pathMetric.length - distance;
        }
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + length),
          Offset.zero,
        );
        distance += length;
        draw = !draw;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}