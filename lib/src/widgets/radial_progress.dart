import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    super.key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryThickness = 10.0,
    this.secondaryThickness = 4.0,
  });

  final double percentage, primaryThickness, secondaryThickness;
  final Color primaryColor, secondaryColor;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final animateDifference = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              (widget.percentage - animateDifference) +
                  (animateDifference * controller.value),
              widget.primaryColor,
              widget.secondaryColor,
              widget.primaryThickness,
              widget.secondaryThickness,
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  _MyRadialProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryThickness,
    this.secondaryThickness,
  );

  double percentage;
  final double primaryThickness, secondaryThickness;
  final Color primaryColor, secondaryColor;

  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red,
      ],
    );

    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    final paintCircle = Paint()
      ..strokeWidth = secondaryThickness
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCircle);

    final paintArc = Paint()
      ..strokeWidth = primaryThickness
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

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
