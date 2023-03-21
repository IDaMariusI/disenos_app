import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:disenos_app/src/widgets/widgets.dart';

class ItemBoton {
  ItemBoton(this.icon, this.text, this.color1, this.color2);

  final Color color1, color2;
  final IconData icon;
  final String text;
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        const Color(0xff6989F5),
        const Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        const Color(0xff66A9F2),
        const Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        const Color(0xffF2D572),
        const Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        const Color(0xff317183),
        const Color(0xff46997D),
      ),
    ];

    List<Widget> itemMap = items
        .map(
          (item) => FadeInLeft(
            duration: const Duration(milliseconds: 250),
            child: FatButton(
              icon: item.icon,
              text: item.text,
              color1: item.color1,
              color2: item.color2,
              onPress: () {},
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  if (isLarge) const SizedBox(height: 80),
                  ...itemMap,
                ],
              ),
            ),
          ),
          if (isLarge) _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica',
          subtitle: 'Haz solicitado',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carBurst,
      text: 'Motor Accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      onPress: () {
        //print('Click');
      },
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
