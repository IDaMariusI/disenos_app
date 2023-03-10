import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class RoundedEdgesHeader extends StatelessWidget {
  const RoundedEdgesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _DiagonalHeaderPainter()),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    //Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    //Draw with path and pencil
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleHeader extends StatelessWidget {
  const TriangleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _TriangleHeaderPainter()),
    );
  }
}

class _TriangleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    //Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    //Draw with path and pencil
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PeakHeader extends StatelessWidget {
  const PeakHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _PeakHeaderPainter()),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    //Properties
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    //Draw with path and pencil
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.28);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _CurvedHeaderPainter()),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.40,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesHeader extends StatelessWidget {
  const WavesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _WavesHeaderPainter()),
    );
  }
}

class _WavesHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.50,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesGradientHeader extends StatelessWidget {
  const WavesGradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _WavesGradientHeaderPainter()),
    );
  }
}

class _WavesGradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [0.2, 0.5, 1.0],
    );

    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180,
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    final path = Path();

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.50,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526BF6),
            Color(0xff67ACF2),
          ],
        ),
      ),
    );
  }
}
