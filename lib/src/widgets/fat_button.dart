import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  const FatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _FatButtonBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(height: 140, width: 40),
            FaIcon(FontAwesomeIcons.carBurst, color: Colors.white, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                'Motor Accident',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            SizedBox(width: 40),
          ],
        ),
      ],
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: <Color>[
            Color(0xff6989F5),
            Color(0xff906EF5),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                FontAwesomeIcons.carBurst,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
