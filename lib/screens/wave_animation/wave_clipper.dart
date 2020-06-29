import 'dart:math';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final double value;
  final List<Offset> wavePoints;

  WaveClipper({@required this.value, this.wavePoints});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    _makeSinWave(size);

    path.addPolygon(wavePoints, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  void _makeSinWave(Size size) {
    wavePoints.clear();
    wavePoints.length = size.width.toInt();
    for (int i = 0; i < size.width.toInt(); i += 1) {
      double y = 20 * sin(1 / 100 * i + value);
      wavePoints[i] = Offset(
        i.toDouble(),
        y + 40,
      );
    }
  }
}
