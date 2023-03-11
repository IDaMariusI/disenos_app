import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/widgets/widgets.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FatButton(
          icon: FontAwesomeIcons.carBurst,
          text: 'Motor Accident',
          color1: const Color(0xff6989F5),
          color2: const Color(0xff906EF5),
          onPress: () {
            print('Click');
          },
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia Médica',
      subtitle: 'Haz solicitado',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
