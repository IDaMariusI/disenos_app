import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgress(50),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;

  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    //Complete Circle
    final paintCircle = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCircle);

    //Arc
    final paintArc = Paint()
      ..strokeWidth = 8
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    //Fill
    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
